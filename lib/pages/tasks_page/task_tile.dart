import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_sample/controllers/login_controller/login_controller.dart';
import 'package:flutter_todo_sample/controllers/tasks_controller/tasks_controller.dart';
import 'package:flutter_todo_sample/entities/task.dart';
import 'package:flutter_todo_sample/pages/tasks_page/task_edit_page.dart';
import 'package:hooks_riverpod/all.dart';

class TaskTile extends HookWidget {

  final Task task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {

    final user = useProvider(
        loginProvider.state.select((s) => s.appUser)
    );

    return Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
      ),
      child: Slidable(
        key: Key(task.id),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: [
          IconSlideAction(
            // caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              context.read(tasksProvider).deleteTask(user, task);
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("タスクを削除しました")));
            },
          ),
        ],
        child:
          ListTile(
            leading: GestureDetector(
              onTap: () {
                context.read(tasksProvider).updateTask(user, task.copyWith(isCompleted: !task.isCompleted));
                if(!task.isCompleted) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("タスクを完了しました")));
                }
              },
              child: task.isCompleted ? Icon(Icons.radio_button_on) : Icon(Icons.radio_button_off)
            ),
            title: Text(
              task.title,
              style: TextStyle(
                  color:Colors.black,
                  fontSize: 18.0
              ),
            ),
            onTap: () {
              // 編集ページにいく
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return TaskEditPage(task: task,);
                },
              ));
            }, // タップ
          ),
      )
    )
    ;
  }
}
