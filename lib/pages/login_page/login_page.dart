import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/controllers/facebook_login_controller/facebook_login_controller.dart';
import 'package:flutter_todo_sample/controllers/google_login_controller/google_login_controller.dart';
import 'package:flutter_todo_sample/pages/login_page/facebook_login_button.dart';
import 'package:flutter_todo_sample/pages/login_page/facebook_logout_button.dart';
import 'package:flutter_todo_sample/pages/login_page/google_login_button.dart';
import 'package:flutter_todo_sample/pages/login_page/google_logout_button.dart';
import 'package:hooks_riverpod/all.dart';

class LoginPage extends HookWidget {

  @override
  Widget build(BuildContext context) {

    // facebook button setup
    context.read(facebookLoginProvider).init();
    final facebookButton = useProvider(
        facebookLoginProvider.state.select((s) => s.isLogin() ? FacebookLogoutButton() : FacebookLoginButton())
    );

    // google button setup
    context.read(googleLoginProvider).init();
    final googleButton = useProvider(
        googleLoginProvider.state.select((s) => s.isLogin() ? GoogleLogoutButton() : GoogleLoginButton())
    );

    return Scaffold( //天地中央 refs: https://qiita.com/sekitaka_1214/items/03255fd9f61685503af3
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            facebookButton,
            googleButton,
          ],
        ),
      ),
    );
  }
}