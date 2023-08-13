part of '../TodoItemEdit.dart';

class TodoItemCreateUseCase extends UseCase {
  AppState _appState;
  EntityGateway _entityGateway;
  TodoItemCreateUseCase(this._entityGateway, this._appState)
      : super(_appState);

  @override
  EditingTodo get initialEditingTodo => EditingTodo();

  @override
  Future<Result<Todo>> save(EditingTodo editingTodo) async {
    return await _entityGateway.todoManager
        .create(editingTodo.toTodoValues());
  }

  @override
  void updateAppStateDataReferences(Todo todo) {
    final callback = (_appState.itemStartMode as TodoItemStartModeCreate).createCallback;
    final updateCallback = callback(todo);
    _appState.itemStartMode = TodoItemStartModeUpdate(todo.id, updateCallback);
  }

  @override
  void cancel() {
    emit(presentCreateCancelled());
  }
}
