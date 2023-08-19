part of '../TodoItemEdit.dart';

@visibleForTesting
class TodoItemCreateUseCase extends UseCase {
  EntityGateway _entityGateway;
  TodoItemCreateUseCase(this._entityGateway, super._toDoListCallbackSubject,
      super._currentTodoSubject, super._itemStartModeSubject);

  @override
  EditingTodo get initialEditingTodo => EditingTodo();

  @override
  Future<Result<Todo>> save(EditingTodo editingTodo) async {
    return await _entityGateway.todoManager.create(editingTodo.toTodoValues());
  }

  @override
  void cancel() {
    emit(presentCreateCancelled());
  }
}
