//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoItemEditViewModel.dart';

sealed class TodoItemEditPresenterOutput {}

class showModel extends TodoItemEditPresenterOutput {
  final TodoItemEditViewModel model;
  showModel(this.model);
}
