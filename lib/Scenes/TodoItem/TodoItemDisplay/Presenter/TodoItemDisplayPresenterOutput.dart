//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoItemDisplayRowViewModel.dart';

sealed class TodoItemDisplayPresenterOutput {}

class showFieldList extends TodoItemDisplayPresenterOutput {
  final List<TodoItemDisplayRowViewModel> model;
  showFieldList(this.model);
}
