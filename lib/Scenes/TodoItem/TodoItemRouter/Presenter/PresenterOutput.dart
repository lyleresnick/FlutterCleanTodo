//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

sealed class _PresenterOutput {}

@visibleForTesting
class showEditView extends _PresenterOutput {}

@visibleForTesting
class showDisplayView extends _PresenterOutput {}

@visibleForTesting
class showMessageView extends _PresenterOutput {
  final String id;
  showMessageView(this.id);
}
