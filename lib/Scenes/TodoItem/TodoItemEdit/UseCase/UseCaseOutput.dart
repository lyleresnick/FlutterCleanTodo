//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

sealed class _UseCaseOutput {}

class presentModel extends _UseCaseOutput {
  final PresentationModel model;
  presentModel(this.model);
}

class presentSaveCompleted extends _UseCaseOutput {}
class presentEditingCancelled extends _UseCaseOutput {}
class presentCreateCancelled extends _UseCaseOutput {}

