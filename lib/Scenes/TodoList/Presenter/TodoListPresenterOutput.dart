//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoListViewModel.dart';

sealed class TodoListPresenterOutput {}

class showModel extends TodoListPresenterOutput {
  final TodoListViewModel model;
  showModel(this.model);
}
