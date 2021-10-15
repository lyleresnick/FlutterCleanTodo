//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_todo/Entities/Priority.dart';
part "TodoItemDisplayUseCaseOutput.freezed.dart";

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


@freezed
class TodoItemDisplayUseCaseOutput with _$TodoItemDisplayUseCaseOutput  {
    const factory TodoItemDisplayUseCaseOutput.presentBegin() = _PresentBegin;
    const factory TodoItemDisplayUseCaseOutput.presentEnd() = _PresentEnd;
    const factory TodoItemDisplayUseCaseOutput.presentString(FieldName field, String value) = _PresentString;
    const factory TodoItemDisplayUseCaseOutput.presentDate(FieldName field, DateTime value) = _PresentDate;
    const factory TodoItemDisplayUseCaseOutput.presentBool(FieldName field, bool value) = _PresentBool;
    const factory TodoItemDisplayUseCaseOutput.presentPriority(FieldName field, Priority value) = _PresentPriority;
}

