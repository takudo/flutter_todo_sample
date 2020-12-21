import 'package:flutter_todo_sample/entities/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_state.freezed.dart';

@freezed
abstract class TasksState with _$TasksState{
  TasksState._();

  factory TasksState({
    List<Task> tasks
  }) = _TasksState;
}
