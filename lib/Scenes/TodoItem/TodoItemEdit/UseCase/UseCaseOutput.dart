//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

sealed class _UseCaseOutput {}

@visibleForTesting
class presentModel extends _UseCaseOutput {
  final PresentationModel model;
  presentModel(this.model);
}

@visibleForTesting
class presentLoading extends _UseCaseOutput {}
@visibleForTesting
class presentSaveCompleted extends _UseCaseOutput {}
@visibleForTesting
class presentEditingCancelled extends _UseCaseOutput {}
@visibleForTesting
class presentCreateCancelled extends _UseCaseOutput {}

