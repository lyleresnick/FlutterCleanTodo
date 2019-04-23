//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

abstract class TodoListPresenterOutput implements
    TodoListViewReadyPresenterOutput,
    TodoListCreatePresenterOutput,
    TodoListDeletePresenterOutput,
    TodoListChangedPresenterOutput {}

abstract class TodoListViewReadyPresenterOutput {
    void showTodoList();
}

abstract class TodoListCreatePresenterOutput {
    void showAdded(int index);
}

abstract class TodoListDeletePresenterOutput {
    void showUndoDeleted(int index);
}

abstract class TodoListChangedPresenterOutput {
    void showChanged(int index);
}

