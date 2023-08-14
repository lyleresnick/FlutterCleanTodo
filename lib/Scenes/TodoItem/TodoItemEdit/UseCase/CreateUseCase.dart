part of '../TodoItemEdit.dart';

@visibleForTesting
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
  void cancel() {
    emit(presentCreateCancelled());
  }
}
