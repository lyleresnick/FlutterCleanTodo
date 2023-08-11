//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

sealed class PresenterOutput {}

class showModel extends PresenterOutput {
  final ViewModel model;
  showModel(this.model);
}
