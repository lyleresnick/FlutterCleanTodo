//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

sealed class _UseCaseOutput {}

@visibleForTesting
class presentModel extends _UseCaseOutput {
  final PresentationModel model;
  presentModel(this.model);
}

@visibleForTesting
class presentItemDetail extends _UseCaseOutput {}
