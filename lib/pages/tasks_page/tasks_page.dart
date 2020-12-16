import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_sample/controllers/tasks_controller/tasks_controller.dart';
import 'package:flutter_todo_sample/pages/tasks_page/task_modal.dart';
import 'package:flutter_todo_sample/pages/tasks_page/task_tile.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TasksPage extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final tasks = useProvider(
        tasksProvider.state.select((_) => _.tasks)
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('タスク一覧の名称'),
        // actions: [
        //   IconButton(icon: Icon(Icons.menu), onPressed: (){
        //     // TODO メニューへ
        //     debugPrint('メニューボタンが押下');
        //   })
        // ]
      ),
      body: Center(
        child:
          ListView(
            children: (tasks.map((task) => TaskTile(task))).toList(),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showCupertinoModalBottomSheet(
            expand: false,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => TaskModal(),
          );
        },
      ),
    );
  }
}