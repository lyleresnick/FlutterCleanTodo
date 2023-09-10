//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../Abstraction/TodoValues.dart';
import 'Priority.dart';

typedef Todo = ({
  String id,
  String title,
  String note,
  DateTime? completeBy,
  Priority priority,
  bool completed
});

extension TodoExt on Todo {

  TodoValues get todoValues => (
      title: this.title,
      note: this.note,
      completeBy: this.completeBy,
      priority: this.priority,
      completed: this.completed);
}
