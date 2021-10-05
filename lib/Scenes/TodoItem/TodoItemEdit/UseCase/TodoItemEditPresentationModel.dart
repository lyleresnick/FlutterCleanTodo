//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/Common/ErrorMessages.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/Entities/Priority.dart';

class TodoItemEditPresentationModel {
  final String title;
  final String note;
  DateTime _completeBy;
  final int priority;
  bool completed;
  ErrorMessage errorMessage;
  bool showEditCompleteBy;

  TodoItemEditPresentationModel(
      {@required this.title,
      @required this.note,
      DateTime completeBy,
      @required this.priority,
      @required this.completed,
      this.errorMessage,
      this.showEditCompleteBy = false})
      : _completeBy = completeBy;

  DateTime get completeBy => _completeBy;

  factory TodoItemEditPresentationModel.fromEditingTodo(EditingTodo editingTodo,
      {ErrorMessage errorMessage, bool showEditCompleteBy = false}) {
    return TodoItemEditPresentationModel(
        title: editingTodo.title,
        note: editingTodo.note,
        completeBy: editingTodo.completeBy,
        priority: bangsFromPriority(editingTodo.priority),
        completed: editingTodo.completed,
        errorMessage: errorMessage,
        showEditCompleteBy: showEditCompleteBy);
  }
}
