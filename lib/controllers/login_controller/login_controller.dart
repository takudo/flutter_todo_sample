import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/all.dart';
import 'login_state.dart';

final loginProvider = StateNotifierProvider((ref) => LoginController());

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState()) ;

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

    await Firebase.initializeApp();
    _firebaseAuth = FirebaseAuth.instance;

    final googleAccount = await _initGoogle();
    final facebookAccount = await _initFacebook();

    state = state.copyWith(
      googleAccount: googleAccount,
      facebookAccount: facebookAccount,
      initialized: true
    );
  }

  Future<GoogleSignInAccount> _initGoogle() async {
    var googleAccount;

    if((await googleSignin.isSignedIn()) && state.googleAccount == null) {
      googleAccount = await googleSignin.signInSilently();
    }

    return googleAccount;
  }

  googleLogin() async {
    final account = await googleSignin.signIn();
    state = state.copyWith(googleAccount: account);
  }

  googleLogout() async {
    final account = await googleSignin.signOut();
    state = state.copyWith(googleAccount: account);
  }

  Future<User> _initFacebook() async {
    var facebookAccount;

    if((await _facebookAuth.isLoggedIn) && state.facebookAccount == null) {

      final accessToken = await _facebookAuth.currentAccessToken;
      final credential = FacebookAuthProvider.credential(
        accessToken.token,
      );

      // Firebaseのユーザー情報を取得
      final user = (await _firebaseAuth.signInWithCredential(credential)).user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      facebookAccount = await _firebaseAuth.currentUser;
      assert(user.uid == facebookAccount.uid);
    }
    return facebookAccount;
  }

  facebookLogin() async {

    // Facebookの認証画面が開く
    final facebookLoginResult = await _facebookAuth.logIn((['email']));

    // Firebaseのユーザー情報と連携
    final credential = FacebookAuthProvider.credential(
      facebookLoginResult.accessToken.token,
    );

    // Firebaseのユーザー情報を取得
    final user = (await _firebaseAuth.signInWithCredential(credential)).user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final currentUser = await _firebaseAuth.currentUser;
    assert(user.uid == currentUser.uid);

    state = state.copyWith(facebookAccount: currentUser);
  }

  facebookLogout() async {
    await _facebookAuth.logOut();
    state = state.copyWith(facebookAccount: null);
  }


}