import 'package:flutter_todo_sample/controllers/tasks_controller/tasks_state.dart';
import 'package:hooks_riverpod/all.dart';

final tasksProvider = StateNotifierProvider((ref) => TasksController());

class TasksController extends StateNotifier<TasksState> {
  TasksController() : super(TasksState(tasks: [])) ;

  addTask(String title) {
    final tasks = [title] + state.tasks;
    state = state.copyWith(tasks: tasks);
  }

}
