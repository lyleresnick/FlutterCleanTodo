//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

sealed class UseCaseOutput {}

class presentEditView extends UseCaseOutput {}

class presentDisplayView extends UseCaseOutput {}

class presentNotFound extends UseCaseOutput {
  final String id;
  presentNotFound(this.id);
}
