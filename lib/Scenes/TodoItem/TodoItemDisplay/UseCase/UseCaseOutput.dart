//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

enum FieldName { title, note, completeBy, priority, completed }

sealed class _UseCaseOutput {}

@visibleForTesting
class presentBegin extends _UseCaseOutput {}

@visibleForTesting
class presentEnd extends _UseCaseOutput {}

@visibleForTesting
class presentString extends _UseCaseOutput {
  final FieldName field;
  final String value;
  presentString(this.field, this.value);
}

@visibleForTesting
class presentDate extends _UseCaseOutput {
  final FieldName field;
  final DateTime value;
  presentDate(this.field, this.value);
}

@visibleForTesting
class presentBool extends _UseCaseOutput {
  final FieldName field;
  final bool value;
  presentBool(this.field, this.value);
}

@visibleForTesting
class presentPriority extends _UseCaseOutput {
  final FieldName field;
  final Priority value;
  presentPriority(this.field, this.value);
}
