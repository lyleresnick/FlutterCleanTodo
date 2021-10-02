//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

typedef  TodoListChangedItemCallback = void Function();

abstract class TodoItemStartMode {
    TodoListChangedItemCallback todoListChangedItemCallback;
    TodoItemStartMode(this.todoListChangedItemCallback);
}

class TodoItemStartModeCreate extends TodoItemStartMode {
    TodoItemStartModeCreate(todoListChangedItemCallback) : super(todoListChangedItemCallback);
}

class TodoItemStartModeUpdate extends TodoItemStartMode {
    int index;
    TodoItemStartModeUpdate(this.index, todoListChangedItemCallback) : super(todoListChangedItemCallback);
}

