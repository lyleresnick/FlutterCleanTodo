//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:todo_api/api.dart';

import '../Entities/Priority.dart';

class TodoValues {
  final String title;
  final String note;
  final DateTime? completeBy;
  final Priority priority;
  final bool completed;

  TodoValues(
      {required this.title,
      required this.note,
      required this.completeBy,
      required this.priority,
      required this.completed});

  TodoParams toTodoParams() {
    return TodoParams(
        title: this.title,
        note: this.note,
        priority: priorityEnumFromPriority(this.priority),
        completeBy: this.completeBy,
        completed: this.completed);
  }
}
