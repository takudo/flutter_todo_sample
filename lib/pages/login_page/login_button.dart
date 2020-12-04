import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/controllers/login_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/all.dart';

class LoginButton extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final buttonText = useProvider(
      loginProvider.state.select((s) => s.isLogin() ? 'Logout with Google' : 'Sign in with Google')
    );

    // google のロゴ付きボタン refs: https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed
    return RaisedButton(
        color: Colors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        onPressed: context.read(loginProvider).login,
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
                  buttonText,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  _signinWithGoogle() async {


    // StateNotifierProvider.autoDispose.family()
    // loginProvider.state.select((s) => s.)

    // loginProvider.state.select((c) => c)


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