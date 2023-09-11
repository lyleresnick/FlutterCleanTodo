//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

enum FieldName { title, note, completeBy, priority, completed }

sealed class _RowPresentationModel {}

@visibleForTesting
class stringRow extends _RowPresentationModel {
  final FieldName field;
  final String value;
  stringRow(this.field, this.value);
}

@visibleForTesting
class dateRow extends _RowPresentationModel {
  final FieldName field;
  final DateTime value;
  dateRow(this.field, this.value);
}

@visibleForTesting
class boolRow extends _RowPresentationModel {
  final FieldName field;
  final bool value;
  boolRow(this.field, this.value);
}

@visibleForTesting
class priorityRow extends _RowPresentationModel {
  final FieldName field;
  final Priority value;
  priorityRow(this.field, this.value);
}
