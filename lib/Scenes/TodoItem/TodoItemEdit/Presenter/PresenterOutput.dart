//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

sealed class _PresenterOutput {}

@visibleForTesting
class showModel extends _PresenterOutput {
  final ViewModel model;
  showModel(this.model);
}
