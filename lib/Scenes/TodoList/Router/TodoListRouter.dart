//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../UseCase/TodoListPresentationModel.dart';

typedef void TodoListChangedItemCallback(TodoListPresentationModel model);

abstract class TodoListRouter  {

    void routeDisplayItem(String id, TodoListChangedItemCallback completion);
    void routeCreateItem(TodoListChangedItemCallback completion);
}
