import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoValues.dart';
import 'package:flutter_todo/Scenes/AppState/AppState.dart';

import '../../TodoItemStartMode.dart';
import 'TodoItemEditUseCase.dart';
import 'TodoItemEditUseCaseOutput.dart';

class TodoItemUpdateUseCase extends TodoItemEditUseCase {
  AppState _appState;
  EntityGateway _entityGateway;
  TodoItemUpdateUseCase(this._entityGateway, this._appState)
      : super(_appState);
  @override
  getInitialEditingTodo() => EditingTodo.fromTodo(_appState.itemState.currentTodo);

  @override
  Future<Result<Todo>> save(EditingTodo editingTodo) async {
    return await _entityGateway.todoManager.update( editingTodo.id!, TodoValues.fromEditing(editingTodo));
  }

  @override
  void copyTodoToList(Todo todo) {
    _appState.toDoList[(_appState.itemStartMode as TodoItemStartModeUpdate).index] = todo;
  }

  @override
  void cancel() {
    emit(presentEditingCancelled());
  }

}
