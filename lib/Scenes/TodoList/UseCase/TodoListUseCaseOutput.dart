//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoListPresentationModel.dart';

sealed class TodoListUseCaseOutput {}

class presentModel extends TodoListUseCaseOutput {
  final TodoListPresentationModel model;
  presentModel(this.model);
}

class presentItemDetail extends TodoListUseCaseOutput {}
