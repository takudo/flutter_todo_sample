import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_sample/pages/login_page/login_page.dart';
import 'package:flutter_todo_sample/pages/tasks_page/tasks_page.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'controllers/login_controller/login_controller.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // for Use local Firebase Emulator
  // final isProduction = bool.fromEnvironment('dart.vm.product');
  // if (!isProduction) {
  //   FirebaseFirestore.instance.settings = Settings(
  //       host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  // }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
class MyApp extends HookWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    context.read(loginProvider).init();
    final logined = useProvider(
        loginProvider.state.select((s) => s.isLogin)
    );

    final theme = ThemeData(
      primarySwatch: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    final localizationsDelegates = [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
    final supportedLocales =  [
      Locale('ja', 'JP'),
    ];

    if(logined) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        home: TasksPage(),
      );
    } else {
      return MaterialApp(
        theme: theme,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        home: LoaderOverlay(
            useDefaultLoading: true,
            child: LoginPage()
        ),
      );
    }
  }
}
