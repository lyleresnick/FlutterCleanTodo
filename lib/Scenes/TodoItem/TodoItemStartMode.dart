//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../TodoList/UseCase/TodoListPresentationModel.dart';

typedef  TodoListChangedItemCallback = void Function(TodoListPresentationModel todoListPresentationModel);


abstract class TodoItemStartMode {
    TodoListChangedItemCallback todoListChangedItemCallback;
    TodoItemStartMode(this.todoListChangedItemCallback);

}

class TodoItemStartModeCreate extends TodoItemStartMode {
    TodoItemStartModeCreate(todoListChangedItemCallback) : super(todoListChangedItemCallback);
}

class TodoItemStartModeUpdate extends TodoItemStartMode {
    String id;
    TodoItemStartModeUpdate(this.id, todoListChangedItemCallback) : super(todoListChangedItemCallback);
}

