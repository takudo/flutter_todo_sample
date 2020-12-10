import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_sample/pages/login_page/login_page.dart';
import 'package:flutter_todo_sample/pages/tasks_page/tasks_page.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'controllers/login_controller/login_controller.dart';

void main() => runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );

class MyApp extends HookWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    context.read(loginProvider).init();
    final logined = useProvider(
        loginProvider.state.select((s) => s.isLogin)
    );

    if(logined) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TasksPage(),
      );
    } else {
        return MaterialApp(
          home: LoaderOverlay(
              useDefaultLoading: true,
              child: LoginPage()
          ),
        );
    }
  }
}
