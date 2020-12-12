import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_sample/controllers/tasks_controller/tasks_state.dart';
import 'package:flutter_todo_sample/entities/Task.dart';
import 'package:hooks_riverpod/all.dart';

final tasksProvider = StateNotifierProvider((ref) => TasksController());

class TasksController extends StateNotifier<TasksState> {
  TasksController() : super(TasksState(tasks: [])) {

    final isProduction = bool.fromEnvironment('dart.vm.product');
    // await Firebase.initializeApp();
    if (!isProduction) {
      FirebaseFirestore.instance.settings = Settings(
          host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
    }
    loadTask();
  }
  final taskCollection = FirebaseFirestore.instance.collection('tasks');

  loadTask() async {
    final result = await taskCollection.get();
    final tasks = result.docs.map((d) => Task(title: d.get('title'))).toList();
    state = state.copyWith(tasks: tasks);
  }

  addTask(String title) async {
    await taskCollection.add({'title': title});
    loadTask();
  }

}
