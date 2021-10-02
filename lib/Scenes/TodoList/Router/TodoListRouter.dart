//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../UseCase/TodoListPresentationRowModel.dart';

typedef void TodoListChangedItemCallback(TodoListPresentationRowModel model);

abstract class TodoListRouter  {

    void routeShowItemDetail();

}
