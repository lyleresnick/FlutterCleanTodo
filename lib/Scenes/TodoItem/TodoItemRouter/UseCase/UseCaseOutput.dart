//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

sealed class _UseCaseOutput {}

@visibleForTesting
class presentEditView extends _UseCaseOutput {}

@visibleForTesting
class presentDisplayView extends _UseCaseOutput {}

@visibleForTesting
class presentNotFound extends _UseCaseOutput {
  final String id;
  presentNotFound(this.id);
}
