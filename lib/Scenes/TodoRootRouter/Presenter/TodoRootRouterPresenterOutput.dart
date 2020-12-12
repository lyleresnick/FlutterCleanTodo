//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

abstract class TodoRootRouterPresenterOutput {}

class ShowItem extends TodoRootRouterPresenterOutput { final String id; final TodoListChangedItemCallback completion; ShowItem(this.id, this.completion); }
class ShowCreateItem extends TodoRootRouterPresenterOutput { final TodoListChangedItemCallback completion; ShowCreateItem(this.completion); }
class ShowPop extends TodoRootRouterPresenterOutput {}
