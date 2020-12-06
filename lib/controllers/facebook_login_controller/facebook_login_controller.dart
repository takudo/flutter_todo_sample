import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:hooks_riverpod/all.dart';
import 'facebook_login_state.dart';

final facebookLoginProvider = StateNotifierProvider((ref) => FacebookLoginController());

class FacebookLoginController extends StateNotifier<FacebookLoginState> {
  FacebookLoginController() : super(FacebookLoginState()) ;


  final _auth = FirebaseAuth.instance;
  final facebookLogin = FacebookLogin();

  init() async {

    if((await facebookLogin.isLoggedIn) && state.account == null) {

      final accessToken = await facebookLogin.currentAccessToken;
      final credential = FacebookAuthProvider.credential(
        accessToken.token,
      );

      // Firebaseのユーザー情報を取得
      final user = (await _auth.signInWithCredential(credential)).user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final currentUser = await _auth.currentUser;
      assert(user.uid == currentUser.uid);

      state = state.copyWith(account: currentUser);
    }
  }

  login() async {

    // Facebookの認証画面が開く
    final facebookLoginResult = await facebookLogin.logIn((['email']));

    // Firebaseのユーザー情報と連携
    final credential = FacebookAuthProvider.credential(
      facebookLoginResult.accessToken.token,
    );

    // Firebaseのユーザー情報を取得
    final user = (await _auth.signInWithCredential(credential)).user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);

    state = state.copyWith(account: currentUser);
  }

  logout() async {
    await facebookLogin.logOut();
    state = null;
  }

}