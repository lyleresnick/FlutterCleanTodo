part of '../TodoItemEdit.dart';

class TodoItemUpdateUseCase extends UseCase {
  AppState _appState;
  EntityGateway _entityGateway;
  TodoItemUpdateUseCase(this._entityGateway, this._appState)
      : super(_appState);
  @override
  EditingTodo get initialEditingTodo => EditingTodo.fromTodo(_appState.itemState.currentTodo);

  @override
  Future<Result<Todo>> save(EditingTodo editingTodo) async {
    return await _entityGateway.todoManager.update( editingTodo.id!, editingTodo.toTodoValues());
  }

  @override
  void updateAppStateDataReferences(Todo todo) {
    _appState.toDoList![(_appState.itemStartMode as TodoItemStartModeUpdate).index] = todo;
  }

  @override
  void cancel() {
    emit(presentEditingCancelled());
  }

}
