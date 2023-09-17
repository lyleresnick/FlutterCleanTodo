//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
class PresentationModel {
  final List<PresentationRowModel> rows;
  PresentationModel(this.rows);

  PresentationModel.fromEntities(List<Todo> entities)
      : rows = entities.indexed
            .map((indexedPair) =>
                PresentationRowModel(indexedPair.$2, indexedPair.$1))
            .toList() {
    rows.sort((a, b) {
      return switch ((a.completeBy, b.completeBy)) {
        (null, null) => 0,
        (null, _) => 1,
        (_, null) => -1,
        _ => a.completeBy!.compareTo(b.completeBy!)
      };
    });
  }
}

@visibleForTesting
class PresentationRowModel {
  final int index;
  final String id;
  final String title;
  final DateTime? completeBy;
  final Priority priority;
  final bool completed;

  PresentationRowModel(Todo entity, int index)
      : index = index,
        id = entity.id,
        title = entity.title,
        completeBy = entity.completeBy,
        priority = entity.priority,
        completed = entity.completed;
}
