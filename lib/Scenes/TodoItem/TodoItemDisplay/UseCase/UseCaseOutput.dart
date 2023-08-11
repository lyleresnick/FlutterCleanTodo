//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

enum FieldName {
    title,
    note,
    completeBy,
    priority,
    completed
}

String fieldNameToString(FieldName fieldName) {
    final nameWithPrefix = fieldName.toString();
    return nameWithPrefix.split('.').last;
}


sealed class UseCaseOutput {}

class presentBegin extends UseCaseOutput {}
class presentEnd extends UseCaseOutput {}

class presentString extends UseCaseOutput {
    final FieldName field;
    final String value;
    presentString(this.field, this.value);
}

class presentDate extends UseCaseOutput {
    final FieldName field;
    final DateTime value;
    presentDate(this.field, this.value);
}
class presentBool extends UseCaseOutput {
    final FieldName field;
    final bool value;
    presentBool(this.field, this.value);
}

class presentPriority extends UseCaseOutput {
    final FieldName field;
    final Priority value;
    presentPriority(this.field, this.value);
}
