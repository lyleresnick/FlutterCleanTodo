//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

@visibleForTesting
class PresentationModel {
  final String title;
  final String note;
  final DateTime? _completeBy;
  final Priority priority;
  final bool completed;
  final String modeTitle;
  final ErrorMessage? errorMessage;
  final bool showEditCompleteBy;
  final bool isWaiting;

  PresentationModel({
    required this.title,
    required this.note,
    DateTime? completeBy,
    required this.priority,
    required this.completed,
    required this.modeTitle,
    this.errorMessage,
    this.showEditCompleteBy = false,
    this.isWaiting = false,
  }) : _completeBy = completeBy;

  DateTime? get completeBy => _completeBy;

  factory PresentationModel.fromEditingTodo(EditingTodo editingTodo,
      {required String modeTitle,
        ErrorMessage? errorMessage,
      bool showEditCompleteBy = false,
      bool isWaiting = false}) {
    return PresentationModel(
        title: editingTodo.title,
        note: editingTodo.note,
        completeBy: editingTodo.completeBy,
        priority: editingTodo.priority,
        completed: editingTodo.completed,
        modeTitle: modeTitle,
        errorMessage: errorMessage,
        isWaiting: isWaiting,
        showEditCompleteBy: showEditCompleteBy);
  }
}
