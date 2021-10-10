//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../Presenter/TodoListRowViewModel.dart';

abstract class TodoListPresenterOutput {}
class ShowTodoListModel extends TodoListPresenterOutput { final List<TodoListRowViewModel> viewModelList; ShowTodoListModel(this.viewModelList); }

