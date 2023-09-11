//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

enum FieldName { title, note, completeBy, priority, completed }

sealed class _RowPresentationModel {
  final FieldName field;
  _RowPresentationModel(this.field);

}

@visibleForTesting
class stringRow extends _RowPresentationModel {
  final String value;
  stringRow(super.field, this.value);
}

@visibleForTesting
class dateRow extends _RowPresentationModel {
  final DateTime value;
  dateRow(super.field, this.value);
}

@visibleForTesting
class boolRow extends _RowPresentationModel {
  final bool value;
  boolRow(super.field, this.value);
}

@visibleForTesting
class priorityRow extends _RowPresentationModel {
  final Priority value;
  priorityRow(super.field, this.value);
}
