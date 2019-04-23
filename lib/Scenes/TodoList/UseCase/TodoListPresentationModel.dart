//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../../Entities/Todo.dart';
import '../../../Entities/Priority.dart';

class TodoListPresentationModel {

    final String id;
    final String title;
    final DateTime completeBy;
    final int priority;
    final bool completed;

    TodoListPresentationModel(Todo entity) :
        id = entity.id,
        title = entity.title,
        completeBy = entity.completeBy,
        priority = bangs(entity.priority),
        completed = entity.completed;
}