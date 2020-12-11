import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks_state.freezed.dart';

@freezed
abstract class TasksState with _$TasksState{
  TasksState._();

  factory TasksState({
    List<String> tasks
  }) = _TasksState;
}
