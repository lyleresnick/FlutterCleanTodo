//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

sealed class TodoItemStartMode {}

class TodoItemStartModeCreate extends TodoItemStartMode {}

class TodoItemStartModeUpdate extends TodoItemStartMode {
    String itemId;
    TodoItemStartModeUpdate(this.itemId);
}

