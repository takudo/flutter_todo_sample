import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_sample/pages/login_page/login_page.dart';

void main() => runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );

class MyApp extends HookWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {

        if(snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: LoginPage(),
          );
        }
        // // TODO ローディング表示
        // return MaterialApp(
        //   home: ,
        // );
      }
    );
      
      
  }
}
