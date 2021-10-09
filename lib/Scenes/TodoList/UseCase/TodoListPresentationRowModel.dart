//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Entities/Todo.dart';

class TodoListPresentationRowModel {

    final String id;
    final String title;
    final DateTime? completeBy;
    final int priority;
    final bool completed;

    TodoListPresentationRowModel(Todo entity) :
        id = entity.id,
        title = entity.title,
        completeBy = entity.completeBy,
        priority = bangsFromPriority(entity.priority),
        completed = entity.completed;
}