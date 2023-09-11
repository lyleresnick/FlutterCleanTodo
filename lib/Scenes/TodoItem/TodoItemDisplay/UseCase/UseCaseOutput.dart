//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

sealed class _UseCaseOutput {}

@visibleForTesting
class presentModel extends _UseCaseOutput {
  final List<_RowPresentationModel> modelList;
  presentModel(this.modelList);
}
