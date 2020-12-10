import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/controllers/login_controller/login_controller.dart';
import 'package:flutter_todo_sample/pages/login_page/facebook_login_button.dart';
import 'package:flutter_todo_sample/pages/login_page/facebook_logout_button.dart';
import 'package:flutter_todo_sample/pages/login_page/google_login_button.dart';
import 'package:flutter_todo_sample/pages/login_page/google_logout_button.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPage extends HookWidget {

  @override
  Widget build(BuildContext context) {

    // Navigator.of(context).pushReplacementNamed("/tasks");

    // final login = useProvider(loginProvider.state.select((s) => s.isLogin));

    // final login = context.read(loginProvider).state.isLogin;
    // if(login) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => TasksPage(),
    //       )
    //   );
    //   return Container();
    // }

    // loading
    final loginInitialized = useProvider(
        loginProvider.state.select((s) => s.initialized)
    );
    if(loginInitialized) {
      context.hideLoaderOverlay();
    } else {
      context.showLoaderOverlay();
    }

    // facebook button setup
    final facebookButton = useProvider(
        loginProvider.state.select((s) => s.isFacebookLogin ? FacebookLogoutButton() : FacebookLoginButton())
    );

    // google button setup
    final googleButton = useProvider(
        loginProvider.state.select((s) => s.isGoogleLogin ? GoogleLogoutButton() : GoogleLoginButton())
    );

    return
        Scaffold( //天地中央 refs: https://qiita.com/sekitaka_1214/items/03255fd9f61685503af3
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