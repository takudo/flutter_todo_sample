import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
abstract class Task with _$Task{
  Task._();

  factory Task({
    String id,
    String title,
    @Default(false) bool isCompleted,
  }) = _Task;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Task &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              isCompleted == other.isCompleted
  ;
  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ isCompleted.hashCode;

  static Task fromFirestore(DocumentSnapshot snapshot) {
    final map = snapshot.data();
    final isCompleted = map['isCompleted'] == null ? false : map['isCompleted'];
    return Task(
      id: snapshot.id,
      title: map['title'],
      isCompleted: isCompleted);
  }

}