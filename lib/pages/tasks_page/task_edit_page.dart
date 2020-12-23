import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/controllers/login_controller/login_controller.dart';
import 'package:flutter_todo_sample/controllers/tasks_controller/tasks_controller.dart';
import 'package:flutter_todo_sample/entities/task.dart';
import 'package:hooks_riverpod/all.dart';

class TaskEditPage extends HookWidget {

  final Task task;
  TaskEditPage({this.task});

  final _titleTextController = TextEditingController();
  final _titleTextFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    final taskState = useProvider(
      tasksProvider.state.select((_) => _.tasks.singleWhere((t) => t.id == task.id))
    );
    final user = useProvider(
      loginProvider.state.select((s) => s.appUser)
    );

    _titleTextController.text = taskState.title;

    _titleTextFocusNode.addListener(() {
      if(!_titleTextFocusNode.hasFocus && //フォーカスが外れた
          _titleTextController.text != taskState.title // タイトルの内容が変わっている
      ){
        context.read(tasksProvider).updateTask(user, task.copyWith(title: _titleTextController.text));
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('編集'),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: _titleTextController,
                focusNode: _titleTextFocusNode,
                decoration: InputDecoration(
                    hintText: 'タスクのタイトル'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}