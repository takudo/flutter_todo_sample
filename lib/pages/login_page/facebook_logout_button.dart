import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/controllers/login_controller/login_controller.dart';
import 'package:hooks_riverpod/all.dart';

class FacebookLogoutButton extends HookWidget {

  @override
  Widget build(BuildContext context) {

    return // いろんなかたちのボタン refs: https://zenn.dev/coka01/articles/cb0b632766138e9858e7
      RaisedButton(
        child: const Text('Logout with Facebook', style: TextStyle(color: Colors.white),),
        color: Color(0xFF3B5998),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: context.read(loginProvider).facebookLogout,
      );
  }

}