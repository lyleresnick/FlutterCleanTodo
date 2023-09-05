//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

sealed class _PresenterOutput {}

@visibleForTesting
class showLoading extends _PresenterOutput {}

@visibleForTesting
class showModel extends _PresenterOutput {
  final ViewModel model;
  showModel(this.model);
}
