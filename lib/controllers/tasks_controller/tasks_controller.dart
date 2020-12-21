import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_todo_sample/controllers/tasks_controller/tasks_state.dart';
import 'package:flutter_todo_sample/entities/app_user.dart';
import 'package:flutter_todo_sample/entities/task.dart';
import 'package:hooks_riverpod/all.dart';

final tasksProvider = StateNotifierProvider((ref) => TasksController());

class TasksController extends StateNotifier<TasksState> {
  TasksController() : super(TasksState(tasks: []));

  // final tasksRef = FirebaseFirestore.instance.collection('tasks');
  CollectionReference _tasksRef(AppUser user) => FirebaseFirestore.instance.collection('users').doc(user.id).collection('tasks');

  loadTask(AppUser user) async {
    final result = await _tasksRef(user).get();
    final tasks = result.docs.map((d) => Task(id: d.id, title: d.get('title'))).toList();

    if(!listEquals(tasks, state.tasks)) {
      state = state.copyWith(tasks: tasks);
    }
  }

  addTask(AppUser user, String title) async {
    await _tasksRef(user).add({'title': title});
    loadTask(user);
  }

  updateTask(AppUser user, Task task) async {
    final taskRef = _tasksRef(user).doc(task.id);
    await taskRef.update({'title': task.title});
    loadTask(user);
  }
}
