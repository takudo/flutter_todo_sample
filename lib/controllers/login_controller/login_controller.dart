import 'package:firebase_auth/firebase_auth.dart';
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

  final firebaseAuth = FirebaseAuth.instance;
  final facebookAuth = FacebookLogin();

  init() async {

    var googleAccount, facebookAccount;

    if((await googleSignin.isSignedIn()) && state.googleAccount == null) {
      googleAccount = await googleSignin.signInSilently();
    }

    if((await facebookAuth.isLoggedIn) && state.facebookAccount == null) {

      final accessToken = await facebookAuth.currentAccessToken;
      final credential = FacebookAuthProvider.credential(
        accessToken.token,
      );

      // Firebaseのユーザー情報を取得
      final user = (await firebaseAuth.signInWithCredential(credential)).user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      facebookAccount = await firebaseAuth.currentUser;
      assert(user.uid == facebookAccount.uid);
    }

    state = state.copyWith(
      googleAccount: googleAccount,
      facebookAccount: facebookAccount,
      initialized: true
    );
  }

  googleLogin() async {
    final account = await googleSignin.signIn();
    state = state.copyWith(googleAccount: account);
  }

  googleLogout() async {
    final account = await googleSignin.signOut();
    state = state.copyWith(googleAccount: account);
  }

  facebookLogin() async {

    // Facebookの認証画面が開く
    final facebookLoginResult = await facebookAuth.logIn((['email']));

    // Firebaseのユーザー情報と連携
    final credential = FacebookAuthProvider.credential(
      facebookLoginResult.accessToken.token,
    );

    // Firebaseのユーザー情報を取得
    final user = (await firebaseAuth.signInWithCredential(credential)).user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final currentUser = await firebaseAuth.currentUser;
    assert(user.uid == currentUser.uid);

    state = state.copyWith(facebookAccount: currentUser);
  }

  facebookLogout() async {
    await facebookAuth.logOut();
    state = state.copyWith(facebookAccount: null);
  }


}