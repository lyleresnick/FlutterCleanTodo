//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

sealed class PresenterOutput {}

class showFieldList extends PresenterOutput {
  final List<RowViewModel> model;
  showFieldList(this.model);
}
