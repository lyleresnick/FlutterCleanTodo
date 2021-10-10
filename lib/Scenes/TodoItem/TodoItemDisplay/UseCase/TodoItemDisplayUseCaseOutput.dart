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

abstract class TodoItemDisplayUseCaseOutput {}

class PresentBegin extends TodoItemDisplayUseCaseOutput {}
class PresentString extends TodoItemDisplayUseCaseOutput { final FieldName field; final String value; PresentString(this.field, this.value); }
class PresentDate extends TodoItemDisplayUseCaseOutput { final FieldName field; final DateTime value; PresentDate(this.field, this.value); }
class PresentBool extends TodoItemDisplayUseCaseOutput { final FieldName field; final bool value; PresentBool(this.field, this.value); }
class PresentPriority extends TodoItemDisplayUseCaseOutput { final FieldName field; final Priority value; PresentPriority(this.field, this.value); }
class PresentEnd extends TodoItemDisplayUseCaseOutput {}

