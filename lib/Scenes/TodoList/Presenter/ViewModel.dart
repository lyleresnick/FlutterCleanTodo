//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
typedef ViewModel = ({EquatableList<RowViewModel> rows});

extension on PresentationModel {
  ViewModel get viewModel {
    return (rows: this.rows.map((row) => row._rowViewModel).toEquatableList());
  }
}

@visibleForTesting
typedef RowViewModel = ({
  int index,
  String id,
  String title,
  String completeBy,
  String priority,
  bool completed,
});

extension on RowPresentationModel {
  RowViewModel get _rowViewModel {
    return (
      index: this.index,
      id: this.id,
      title: this.title,
      completeBy:
          (this.completeBy != null) ? localizedDate(this.completeBy!) : "",
      priority: List<String>.generate(this.priority.bangs + 1, (index) => " ")
          .reduce((value, element) => "!$value"),
      completed: this.completed,
    );
  }
}
