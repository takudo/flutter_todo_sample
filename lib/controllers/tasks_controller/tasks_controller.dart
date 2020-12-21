import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_sample/controllers/tasks_controller/tasks_state.dart';
import 'package:flutter_todo_sample/entities/task.dart';
import 'package:hooks_riverpod/all.dart';

final tasksProvider = StateNotifierProvider((ref) => TasksController());

class TasksController extends StateNotifier<TasksState> {
  TasksController() : super(TasksState(tasks: [])) {
    loadTask();
  }
  final tasksRef = FirebaseFirestore.instance.collection('tasks');

  loadTask() async {
    final result = await tasksRef.get();
    final tasks = result.docs.map((d) => Task(id: d.id, title: d.get('title'))).toList();
    state = state.copyWith(tasks: tasks);
  }

  addTask(String title) async {
    await tasksRef.add({'title': title});
    loadTask();
  }

  updateTask(Task task) async {
    final taskRef = tasksRef.doc(task.id);
    await taskRef.update({'title': task.title});
    loadTask();
  }
}
