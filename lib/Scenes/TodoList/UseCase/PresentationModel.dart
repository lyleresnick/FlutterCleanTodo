//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
typedef PresentationModel = ({EquatableList<RowPresentationModel> rows});

extension on List<Todo> {
  PresentationModel presentationModel(bool showCompleted) {
    return (
      rows: this
          .indexed
          .map((indexedPair) =>
              indexedPair.$2._rowPresentationModel(indexedPair.$1))
          .where((model) => showCompleted || model.completed == false)
          .toEquatableList()
        ..sort((a, b) {
          return switch ((a.completeBy, b.completeBy)) {
            (null, null) => 0,
            (null, _) => 1,
            (_, null) => -1,
            _ => a.completeBy!.compareTo(b.completeBy!)
          };
        })
    );
  }
}

@visibleForTesting
typedef RowPresentationModel = ({
  int index,
  String id,
  String title,
  DateTime? completeBy,
  Priority priority,
  bool completed
});

extension on Todo {
  RowPresentationModel _rowPresentationModel(int index) {
    return (
      index: index,
      id: this.id,
      title: this.title,
      completeBy: this.completeBy,
      priority: this.priority,
      completed: this.completed
    );
  }
}
