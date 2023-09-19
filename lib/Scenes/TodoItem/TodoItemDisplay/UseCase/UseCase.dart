//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

@visibleForTesting
class UseCase with StarterBloc<_UseCaseOutput> {
  List<_RowPresentationModel> rowList = [];

  final Todo _todo;

  UseCase(this._todo) {

    rowList.add(stringRow(FieldName.title, _todo.title));
    if (_todo.note != "") {
      rowList.add(stringRow(FieldName.note, _todo.note));
    }
    final completeBy = _todo.completeBy;
    if (completeBy != null) {
      rowList.add(dateRow(FieldName.completeBy, completeBy));
    }
    switch (_todo.priority) {
      case Priority.none:
        break;
      default:
        rowList.add(priorityRow(FieldName.priority, _todo.priority));
    }
    rowList.add(boolRow(FieldName.completed, _todo.completed));
    emit(presentModel(rowList));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
