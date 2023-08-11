//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

class PresentationModel {
  final String title;
  final String note;
  DateTime? _completeBy;
  final Priority priority;
  bool completed;
  ErrorMessage? errorMessage;
  bool showEditCompleteBy;

  PresentationModel(
      {required this.title,
      required this.note,
      DateTime? completeBy,
      required this.priority,
      required this.completed,
      this.errorMessage,
      this.showEditCompleteBy = false})
      : _completeBy = completeBy;

  DateTime? get completeBy => _completeBy;

  factory PresentationModel.fromEditingTodo(EditingTodo editingTodo,
      {ErrorMessage? errorMessage, bool showEditCompleteBy = false}) {
    return PresentationModel(
        title: editingTodo.title,
        note: editingTodo.note,
        completeBy: editingTodo.completeBy,
        priority: editingTodo.priority,
        completed: editingTodo.completed,
        errorMessage: errorMessage,
        showEditCompleteBy: showEditCompleteBy);
  }
}