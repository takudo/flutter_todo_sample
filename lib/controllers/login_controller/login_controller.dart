import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_todo_sample/entities/app_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/all.dart';
import 'login_state.dart';

final loginProvider = StateNotifierProvider((ref) => LoginController());

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState()) ;

  final usersRef = FirebaseFirestore.instance.collection('users');

  final googleSignin = GoogleSignIn(
    scopes: <String>[
      'email',
      'profile' // 参考: スコープ一覧 https://developers.google.com/identity/protocols/oauth2/scopes#google-sign-in
    ],
  );

  var _firebaseAuth;
  final _facebookAuth = FacebookLogin();

  init() async {

    if(state.initialized){
      return;
    }
    _firebaseAuth = FirebaseAuth.instance;

    final googleAccount = await _initGoogle();
    final facebookAccount = await _initFacebook();

    if(googleAccount == null && facebookAccount == null) {
      // google も facebook も未ログイン
      state = state.copyWith(
        initialized: true
      );
      return;
    }

    AppUser appUser;
    if(googleAccount != null) {
      appUser = await _findAppUserByGoogleAccount(googleAccount.uid);
    } else if(facebookAccount != null) {
      appUser = await _findAppUserByFacebookAccount(facebookAccount.uid);
    }

    if(googleAccount != null && appUser == null) {
      appUser = await _createAppUserByGoogleAccount(googleAccount);
      if(facebookAccount != null) {
        appUser = AppUser(id: appUser.id, name: appUser.name, googleAccountId: appUser.googleAccountId, facebookAccountId: facebookAccount.uid);
        appUser = await _updateAppUser(appUser);
      }
    }
    if(facebookAccount != null && appUser == null) {
      appUser = await _createAppUserByFacebookAccount(facebookAccount);
      if(googleAccount != null) {
        appUser = AppUser(id: appUser.id, name: appUser.name, googleAccountId: googleAccount.uid, facebookAccountId: appUser.facebookAccountId);
        appUser = await _updateAppUser(appUser);
      }
    }

    if(appUser.facebookAccountId == null && facebookAccount != null) {
      appUser = AppUser(id: appUser.id, name: appUser.name, googleAccountId: appUser.googleAccountId, facebookAccountId: facebookAccount.uid);
      appUser = await _updateAppUser(appUser);
    }

    if(appUser.googleAccountId == null && googleAccount != null) {
      appUser = AppUser(id: appUser.id, name: appUser.name, googleAccountId: googleAccount.uid, facebookAccountId: appUser.facebookAccountId);
      appUser = await _updateAppUser(appUser);
    }

    state = state.copyWith(
      appUser: appUser,
      googleAccount: googleAccount,
      facebookAccount: facebookAccount,
      initialized: true
    );
  }

  Future<User> _initGoogle() async {
    User googleAccount;

    if((await googleSignin.isSignedIn()) && state.googleAccount == null) {
      final account = await googleSignin.signInSilently();
      googleAccount = await _googleUserByAccount(account);
    }
    return googleAccount;
  }

  Future<User> _googleUserByAccount(GoogleSignInAccount account) async {
    // Firebaseのユーザー情報を取得
    final googleAuth = await account.authentication;
    final credential =  GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final user = (await _firebaseAuth.signInWithCredential(credential)).user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final currentUser = await _firebaseAuth.currentUser;
    assert(user.uid == currentUser.uid);

    return currentUser;
  }

  googleLogin() async {
    final account = await googleSignin.signIn();
    final user = await _googleUserByAccount(account);
    AppUser appUser;

    // すでに AppUser が存在する場合
    if(state.appUser != null ) {
      if(state.appUser.googleAccountId == null) {
        // まだ google account がセットされていない場合
        appUser = AppUser(id: state.appUser.id, name: state.appUser.name, googleAccountId: user.uid, facebookAccountId: state.appUser.facebookAccountId);
        appUser = await _updateAppUser(appUser);
      }
    } else {
      AppUser appUser = await _findAppUserByGoogleAccount(user.uid);
      if(appUser == null) {
        // 新規作成する
        appUser = await _createAppUserByGoogleAccount(user);
      }
    }
    state = state.copyWith(
        appUser: appUser,
        googleAccount: user
    );
  }

  googleLogout() async {
    final account = await googleSignin.signOut();
    state = state.copyWith(googleAccount: null);
  }

  Future<User> _initFacebook() async {
    var facebookAccount;

    if((await _facebookAuth.isLoggedIn) && state.facebookAccount == null) {
      facebookAccount = await _facebookUserByFacebookAccessToken((await _facebookAuth.currentAccessToken));
    }
    return facebookAccount;
  }

  Future<User> _facebookUserByFacebookAccessToken(FacebookAccessToken accessToken) async {

    // Firebaseのユーザー情報と連携
    final credential = FacebookAuthProvider.credential(
      accessToken.token,
    );
    // Firebaseのユーザー情報を取得
    final user = (await _firebaseAuth.signInWithCredential(credential)).user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final currentUser = await _firebaseAuth.currentUser;
    assert(user.uid == currentUser.uid);
    return currentUser;
  }


  facebookLogin() async {

    // Facebookの認証画面が開く
    final facebookLoginResult = await _facebookAuth.logIn((['email']));
    final user = await _facebookUserByFacebookAccessToken(facebookLoginResult.accessToken);

    AppUser appUser;

    // すでに AppUser が存在する場合
    if(state.appUser != null ) {
      if(state.appUser.facebookAccountId == null) {
        // まだ facebook account がセットされていない場合はデータを更新する
        appUser = AppUser(id: state.appUser.id, name: state.appUser.name, googleAccountId: state.appUser.googleAccountId, facebookAccountId: user.uid);
        appUser = await _updateAppUser(appUser);
      }
    } else {
      AppUser appUser = await _findAppUserByFacebookAccount(user.uid);
      if(appUser == null) {
        // 新規作成する
        appUser = await _createAppUserByFacebookAccount(user);
      }
    }
    state = state.copyWith(
        appUser: appUser,
        facebookAccount: user
    );
  }

  facebookLogout() async {
    await _facebookAuth.logOut();
    state = state.copyWith(facebookAccount: null);
  }

  Future<AppUser> _findAppUserByGoogleAccount(String googleAccountId) async {

    final snapshot = await usersRef.where("googleAccountId", isEqualTo: googleAccountId).get();
    if(snapshot.size == 0) {
      return null;
    }
    final doc = snapshot.docs[0];
    return AppUser.fromFirestore(doc);
  }

  Future<AppUser> _findAppUserByFacebookAccount(String facebookAccountId) async {
    final snapshot = await usersRef.where("facebookAccountId", isEqualTo: facebookAccountId).get();
    if(snapshot.size == 0) {
      return null;
    }
    final doc = snapshot.docs[0];
    return AppUser.fromFirestore(doc);
  }

  Future<AppUser> _createAppUserByGoogleAccount(User account) async {
    final doc = await (await usersRef.add({'name': account.displayName, 'googleAccountId': account.uid})).get();
    return AppUser.fromFirestore(doc);
  }

  Future<AppUser> _createAppUserByFacebookAccount(User account) async {
    final doc = await (await usersRef.add({'name': account.displayName, 'facebookAccountId': account.uid})).get();
    return AppUser.fromFirestore(doc);
  }

  Future<AppUser> _updateAppUser(AppUser user) async {
    final userRef = usersRef.doc(user.id);
    await userRef.update(user.toFirestore());
    return user;
  }

}