import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
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

            // google のロゴ付きボタン refs: https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed
            RaisedButton(
              color: Colors.white,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              onPressed: _signinWithGoogle,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage("assets/google_logo.png"), height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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

  _signinWithGoogle() async {

    final googleSignin = GoogleSignIn(
      scopes: <String>[
        'email',
        'profile' // 参考: スコープ一覧 https://developers.google.com/identity/protocols/oauth2/scopes#google-sign-in
     ],
    );
    final account = await googleSignin.signIn();

    debugPrint(account.toString());

  }

}