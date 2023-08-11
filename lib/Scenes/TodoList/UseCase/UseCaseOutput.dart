//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

sealed class UseCaseOutput {}

class presentModel extends UseCaseOutput {
  final PresentationModel model;
  presentModel(this.model);
}

class presentItemDetail extends UseCaseOutput {}
