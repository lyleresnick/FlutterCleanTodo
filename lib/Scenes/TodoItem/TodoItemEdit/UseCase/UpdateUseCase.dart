part of '../TodoItemEdit.dart';

@visibleForTesting
class TodoItemUpdateUseCase extends UseCase {
  EntityGateway _entityGateway;
  TodoItemUpdateUseCase(this._entityGateway, super._toDoListCallbackSubject, super._currentTodoSubject);
  @override
  EditingTodo get initialEditingTodo => EditingTodo.fromTodo(_currentTodoSubject.value!);

  @override
  Future<Result<Todo>> save(EditingTodo editingTodo) async {
    return await _entityGateway.todoManager.update( editingTodo.id!, editingTodo.toTodoValues());
  }

  @override
  void cancel() {
    emit(presentEditingCancelled());
  }

}
