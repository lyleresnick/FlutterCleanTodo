//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

sealed class _PresenterOutput {}

@visibleForTesting
class showFieldList extends _PresenterOutput {
  final List<RowViewModel> model;
  showFieldList(this.model);
}
