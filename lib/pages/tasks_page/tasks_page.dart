import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/pages/login_page/facebook_logout_button.dart';
import 'package:flutter_todo_sample/pages/login_page/google_logout_button.dart';

class TasksPage extends HookWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("タスク一覧"),
            FacebookLogoutButton(),
            GoogleLogoutButton(),
          ]
        )
      ),
    );
  }
}