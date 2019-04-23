//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoListPresentationModel.dart';

abstract class TodoListUseCaseOutput implements
    TodoListViewReadyUseCaseOutput,
    TodoListCompletedUseCaseOutput,
    TodoListDeleteUseCaseOutput {}

abstract class TodoListViewReadyUseCaseOutput {

    void presentTodoListBegin();
    void present(TodoListPresentationModel model);
    void presentTodoListEnd();
}

abstract class TodoListCompletedUseCaseOutput {
    void presentCompleted(TodoListPresentationModel model, int index);
}

abstract class TodoListDeleteUseCaseOutput {
    void  presentDeleted(int index);
    void  presentUndoDeleted(int index);
}
