import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/controllers/tasks_controller/task_controller.dart';
import 'package:flutter_todo_sample/pages/tasks_page/task_modal.dart';
import 'package:flutter_todo_sample/pages/tasks_page/task_tile.dart';
import 'package:hooks_riverpod/all.dart';

class TasksPage extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final tasks = useProvider(
        tasksProvider.state.select((_) => _.tasks)
    );

    return Scaffold(
      body: Center(
        child:
          ListView(
            children: (tasks.map((e) => TaskTile(e))).toList(),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) =>
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: TaskModal()
                  ),
                )
              )
          );
        },
      ),
    );
  }
}