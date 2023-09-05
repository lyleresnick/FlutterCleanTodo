//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../Abstraction/TodoValues.dart';
import 'Priority.dart';

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

  TodoValues get todoValues => TodoValues(
      title: this.title,
      note: this.note,
      completeBy: this.completeBy,
      priority: this.priority,
      completed: this.completed);
}

