//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

sealed class PresenterOutput {}

class showEditView extends PresenterOutput {}

class showDisplayView extends PresenterOutput {}

class showMessageView extends PresenterOutput {
  final String id;
  showMessageView(this.id);
}
