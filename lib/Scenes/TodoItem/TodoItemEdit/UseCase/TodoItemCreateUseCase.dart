import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/Managers/TodoValues.dart';
import 'package:flutter_todo/Scenes/AppState/AppState.dart';

import 'TodoItemEditUseCase.dart';
import 'TodoItemEditUseCaseOutput.dart';

class TodoItemCreateUseCase extends TodoItemEditUseCase {
  AppState _appState;
  EntityGateway _entityGateway;
  TodoItemCreateUseCase(this._entityGateway, this._appState)
      : super(_entityGateway, _appState);

  @override
  getInitialEditingTodo() => EditingTodo();

  @override
  Future<Result<Todo, TodoDomainReason>> save(EditingTodo editingTodo) async {
    return await _entityGateway.todoManager
        .create(TodoValues.fromEditing(editingTodo));
  }

  @override
  void copyTodoToList(Todo todo) {
    _appState.toDoList.add(todo);
  }

  @override
  void cancel() {
    streamAdd(TodoItemEditUseCaseOutput.presentCreateCancelled());
  }
}
