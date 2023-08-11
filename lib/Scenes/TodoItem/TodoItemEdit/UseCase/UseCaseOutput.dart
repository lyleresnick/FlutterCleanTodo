//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

sealed class UseCaseOutput {}

class presentModel extends UseCaseOutput {
  final PresentationModel model;
  presentModel(this.model);
}

class presentSaveCompleted extends UseCaseOutput {}
class presentEditingCancelled extends UseCaseOutput {}
class presentCreateCancelled extends UseCaseOutput {}

