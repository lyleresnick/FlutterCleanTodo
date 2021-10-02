//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/Managers/TodoValues.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Scenes/AppState/AppState.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

import 'TodoItemEditUseCaseOutput.dart';
import 'TodoItemEditUseCase.dart';

class TodoItemEditUseCaseSaveTransformer {
  final TodoManager todoManager;
  final AppState appState;

  TodoItemEditUseCaseSaveTransformer(this.todoManager, this.appState);

  void transform(EditingTodo editingTodo,
      StreamSink<TodoItemEditUseCaseOutput> output) async {
    Result result;

    if (editingTodo.title == "") {
      output.add(PresentTitleIsEmpty());
      return;
    }
    switch (appState.itemStartMode.runtimeType) {
      case TodoItemStartModeCreate:
        result = await todoManager.create(
            values: TodoValues.fromEditing(editingTodo));
        break;
      case TodoItemStartModeUpdate:
        result = await todoManager.update(
            id: editingTodo.id, values: TodoValues.fromEditing(editingTodo));
        break;
    }
    if (result is SuccessResult) {
      appState.itemState.currentTodo = result.data;
      appState.itemState.itemChanged = true;

      output.add(PresentSaveCompleted());
    } else if (result is FailureResult)
      assert(false, "Unresolved error: ${result.description}");
    else if (result is DomainIssueResult)
      assert(false, "Unexpected Semantic error: reason ${result.reason}");
  }
}
