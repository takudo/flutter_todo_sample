import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/pages/tasks_page/task_edit_page.dart';

class TaskTile extends HookWidget {

  final String title;
  TaskTile(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
      ),
      child:ListTile(
        leading: Icon(Icons.radio_button_off),
        title: Text(
          title,
          style: TextStyle(
              color:Colors.black,
              fontSize: 18.0
          ),
        ),
        onTap: () {
          // 編集ページにいく
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return TaskEditPage();
            },
          ));
        }, // タップ
        onLongPress: () {
          print("onLongPress called.");
        }, // 長押し
      ),
    );
  }
}
