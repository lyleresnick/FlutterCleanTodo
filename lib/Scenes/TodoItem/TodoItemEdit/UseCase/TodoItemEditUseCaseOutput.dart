//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoItemEditPresentationModel.dart';

sealed class TodoItemEditUseCaseOutput {}

class presentModel extends TodoItemEditUseCaseOutput {
  final TodoItemEditPresentationModel model;
  presentModel(this.model);
}

class presentSaveCompleted extends TodoItemEditUseCaseOutput {}
class presentEditingCancelled extends TodoItemEditUseCaseOutput {}
class presentCreateCancelled extends TodoItemEditUseCaseOutput {}

