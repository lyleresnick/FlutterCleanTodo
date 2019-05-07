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

abstract class TodoItemDisplayUseCaseOutput {

    void presentBegin();
    void presentString(FieldName field, String value);
    void presentDate(FieldName field, DateTime value);
    void presentBool(FieldName field, bool value);
    void presentPriority(FieldName field, Priority value);
    void presentEnd();

}
