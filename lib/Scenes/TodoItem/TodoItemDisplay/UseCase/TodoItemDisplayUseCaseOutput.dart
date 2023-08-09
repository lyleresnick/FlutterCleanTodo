//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';

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


sealed class TodoItemDisplayUseCaseOutput {}

class presentBegin extends TodoItemDisplayUseCaseOutput {}
class presentEnd extends TodoItemDisplayUseCaseOutput {}

class presentString extends TodoItemDisplayUseCaseOutput {
    final FieldName field;
    final String value;
    presentString(this.field, this.value);
}

class presentDate extends TodoItemDisplayUseCaseOutput {
    final FieldName field;
    final DateTime value;
    presentDate(this.field, this.value);
}
class presentBool extends TodoItemDisplayUseCaseOutput {
    final FieldName field;
    final bool value;
    presentBool(this.field, this.value);
}

class presentPriority extends TodoItemDisplayUseCaseOutput {
    final FieldName field;
    final Priority value;
    presentPriority(this.field, this.value);
}
