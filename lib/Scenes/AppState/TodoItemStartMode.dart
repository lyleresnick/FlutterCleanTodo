//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../Repository/Entities/Todo.dart';

typedef  TodoListChangedItemCallback = void Function();

sealed class TodoItemStartMode {}

class TodoItemStartModeCreate extends TodoItemStartMode {
    void Function(Todo) Function(Todo) createCallback;
    TodoItemStartModeCreate(this.createCallback) ;
}

class TodoItemStartModeUpdate extends TodoItemStartMode {
    String itemId;
    void Function(Todo) updateCallback;
    TodoItemStartModeUpdate(this.itemId, this.updateCallback);
}

