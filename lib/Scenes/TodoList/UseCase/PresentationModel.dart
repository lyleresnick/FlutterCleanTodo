//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
class PresentationModel {
    final List<PresentationRowModel> rows;
    PresentationModel(this.rows);

    PresentationModel.fromEntities(List<Todo> entities)
      : rows = entities.map((entity) => PresentationRowModel(entity)).toList();
}

@visibleForTesting
class PresentationRowModel {

    final String id;
    final String title;
    final DateTime? completeBy;
    final Priority priority;
    final bool completed;

    PresentationRowModel(Todo entity) :
        id = entity.id,
        title = entity.title,
        completeBy = entity.completeBy,
        priority = entity.priority,
        completed = entity.completed;
}