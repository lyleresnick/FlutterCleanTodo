//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../TodoList/UseCase/TodoListPresentationModel.dart';

typedef  TodoListChangedItemCallback = void Function(TodoListPresentationModel todoListPresentationModel);


abstract class TodoStartMode {
    TodoListChangedItemCallback todoListChangedItemCallback;
}

class TodoStartModeCreate extends TodoStartMode {}

class TodoStartModeUpdate extends TodoStartMode {
    String id;
}

