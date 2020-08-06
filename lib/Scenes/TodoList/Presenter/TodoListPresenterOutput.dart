//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../Presenter/TodoListRowViewModel.dart';

abstract class TodoListPresenterOutput implements
    TodoListViewReadyPresenterOutput,
    TodoListCreatePresenterOutput,
    TodoListDeletePresenterOutput,
    TodoListChangedPresenterOutput,
    TodoListCompletedPresenterOutput {}

abstract class TodoListViewReadyPresenterOutput {
    void showTodoList(List<TodoListRowViewModel> _viewModelList);
}

abstract class TodoListCreatePresenterOutput {
    void showAdded(List<TodoListRowViewModel> _viewModelList, int index);
}

abstract class TodoListDeletePresenterOutput {
    void showUndoDeleted(List<TodoListRowViewModel> _viewModelList, int index);
    void showDeleted(List<TodoListRowViewModel> _viewModelList, int index);

}

abstract class TodoListChangedPresenterOutput {
    void showChanged(List<TodoListRowViewModel> _viewModelList, int index);
}

abstract class TodoListCompletedPresenterOutput {
    void showCompleted(List<TodoListRowViewModel> _viewModelList, int index);
}

