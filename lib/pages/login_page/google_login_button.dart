import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/controllers/google_login_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/all.dart';

class GoogleLoginButton extends HookWidget {

  @override
  Widget build(BuildContext context) {


    // google のロゴ付きボタン refs: https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed
    return RaisedButton(
        color: Colors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        onPressed: context.read(googleLoginProvider).login,
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
      );
  }

}