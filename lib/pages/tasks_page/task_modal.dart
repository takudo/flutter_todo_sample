import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/controllers/login_controller/login_controller.dart';
import 'package:flutter_todo_sample/controllers/tasks_controller/tasks_controller.dart';
import 'package:flutter_todo_sample/entities/app_user.dart';
import 'package:hooks_riverpod/all.dart';

class TaskModal extends HookWidget {
  final _titleTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = useProvider(
      loginProvider.state.select((s) => s.appUser)
    );

    return Material(child:
      Container(
        margin: EdgeInsets.all(30),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _titleTextController,
                decoration: InputDecoration(
                    hintText: 'タスクのタイトル'
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    child: Text('キャンセル'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  RaisedButton(
                    child: Text('保存'),
                    onPressed: () async {
                      _onSavePressed(context, user, _titleTextController.text);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }

  _onSavePressed(BuildContext context, AppUser user, String taskTitle) {
    context.read(tasksProvider).addTask(user, taskTitle);
  }

}
