//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'package:todo_api/api.dart';

import '../Abstraction/TodoValues.dart';
import '../Entities/Priority.dart';

extension TodoValuesExt on TodoValues {
  TodoParams toTodoParams() {
    return TodoParams(
        title: this.title,
        note: this.note,
        priority: this.priority.priorityEnum,
        completeBy: this.completeBy,
        completed: this.completed);
  }
}

extension _PriorityEnumExt on Priority {
  PriorityEnum get priorityEnum {
    return switch (this) {
      Priority.high => PriorityEnum.high,
      Priority.medium => PriorityEnum.medium,
      Priority.low => PriorityEnum.low,
      Priority.none => PriorityEnum.none
    };
  }
}
