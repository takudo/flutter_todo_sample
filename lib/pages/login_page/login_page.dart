import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/pages/login_page/login_button.dart';

class LoginPage extends HookWidget {

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return Scaffold( //天地中央 refs: https://qiita.com/sekitaka_1214/items/03255fd9f61685503af3
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // いろんなかたちのボタン refs: https://zenn.dev/coka01/articles/cb0b632766138e9858e7
            RaisedButton(
              child: const Text('Sign in with Facebook', style: TextStyle(color: Colors.white),),
              color: Color(0xFF3B5998),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: _signinWithFacebook,
            ),
            LoginButton(),
          ],
        ),
      ),
    );
  }

  _signinWithFacebook() async {

    final _auth = FirebaseAuth.instance;
    final facebookSignIn = new FacebookLogin();
    final facebookLogin = FacebookLogin();

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
  }



}