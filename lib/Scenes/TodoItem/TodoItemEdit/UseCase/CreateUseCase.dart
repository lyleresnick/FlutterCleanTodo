part of '../TodoItemEdit.dart';

class TodoItemCreateUseCase extends UseCase {
  AppState _appState;
  EntityGateway _entityGateway;
  TodoItemCreateUseCase(this._entityGateway, this._appState)
      : super(_appState);

  @override
  getInitialEditingTodo() => EditingTodo();

  @override
  Future<Result<Todo>> save(EditingTodo editingTodo) async {
    return await _entityGateway.todoManager
        .create(editingTodo.toTodoValues());
  }

  @override
  void copyTodoToList(Todo todo) {
    _appState.toDoList.add(todo);
  }

  @override
  void cancel() {
    emit(presentCreateCancelled());
  }
}
