//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:todo_api/api.dart';

import '../Abstraction/TodoValues.dart';
import 'Priority.dart';
import 'Entity.dart';

class Todo {
  final String id;
  final String title;
  final String note;
  final DateTime? completeBy;
  final Priority priority;
  final bool completed;

  Todo(
      {required this.id,
      required this.title,
      this.note = "",
      this.completeBy,
      this.priority = Priority.none,
      this.completed = false});

  static const _idProp = "id";
  static const _titleProp = "title";
  static const _noteProp = "note";
  static const _completeByProp = "completeBy";
  static const _priorityProp = "priority";
  static const _completedProp = "completed";

  factory Todo.fromDynamicValueDictionary(Map<String, dynamic> dictionary) {
    jsonNullCheck(dictionary, [_idProp, _titleProp, _noteProp, _completedProp],
        "Todo.fromStringValueDictionary");
    final id = dictionary[_idProp] as String;
    final title = dictionary[_titleProp] as String;
    final note = dictionary[_noteProp] as String;
    final completeBy = dictionary[_completeByProp] as int?;
    final priority = dictionary[_priorityProp] ?? "none";
    final completed = dictionary[_completedProp] as int;

    return Todo(
        id: id,
        title: title,
        note: note,
        completeBy:
            (completeBy != null) ? _convertSinceEpoch(date: completeBy) : null,
        priority: PriorityExt.fromString(priority),
        completed: (completed == 1));
  }

  Map<String, dynamic> toDynamicValueMap() {
    return {
      _idProp: id,
      _titleProp: title,
      _noteProp: note,
      _completeByProp: completeBy?.millisecondsSinceEpoch,
      _priorityProp: (priority == Priority.none) ? null : priority.name,
      _completedProp: completed ? 1 : 0,
    };
  }

  static DateTime _convertSinceEpoch({required int date}) {
    return DateTime.fromMillisecondsSinceEpoch(date);
  }

  factory Todo.fromTodoResponse(TodoResponse response) => Todo(
      id: response.id,
      title: response.title,
      note: response.note ?? "",
      completeBy: response.completeBy,
      priority: _PriorityEnumExt.fromPriorityEnum(response.priority),
      completed: response.completed);

  TodoValues toTodoValues() => TodoValues(
      title: this.title,
      note: this.note,
      completeBy: this.completeBy,
      priority: this.priority,
      completed: this.completed);
}

extension _PriorityEnumExt on Priority {
  static Priority fromPriorityEnum(PriorityEnum priorityEnum) {
    switch (priorityEnum) {
      case PriorityEnum.high:
        return Priority.high;
      case PriorityEnum.medium:
        return Priority.medium;
      case PriorityEnum.low:
        return Priority.low;
      case PriorityEnum.none:
        return Priority.none;
      default:
        assert(false, "PriorityEnum must be high, medium, low or none");
        return Priority.none;
    }
  }
}
