//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoItemDisplayRowViewModel.dart';

abstract class TodoItemDisplayPresenterOutput {}
class ShowFieldList extends TodoItemDisplayPresenterOutput { List<TodoItemDisplayRowViewModel> model; ShowFieldList(this.model);}

