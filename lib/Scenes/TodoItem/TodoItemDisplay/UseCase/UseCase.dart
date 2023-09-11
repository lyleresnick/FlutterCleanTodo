//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

@visibleForTesting
class UseCase with StarterBloc<_UseCaseOutput> {
  List<_RowPresentationModel> rowList = [];

  final BehaviorSubject<Todo?> _currentTodoSubject;

  UseCase(this._currentTodoSubject) {
    final todo = _currentTodoSubject.value!;

    rowList.add(stringRow(FieldName.title, todo.title));
    if (todo.note != "") {
      rowList.add(stringRow(FieldName.note, todo.note));
    }
    final completeBy = todo.completeBy;
    if (completeBy != null) {
      rowList.add(dateRow(FieldName.completeBy, completeBy));
    }
    switch (todo.priority) {
      case Priority.none:
        break;
      default:
        rowList.add(priorityRow(FieldName.priority, todo.priority));
    }
    rowList.add(boolRow(FieldName.completed, todo.completed));
    emit(presentModel(rowList));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
