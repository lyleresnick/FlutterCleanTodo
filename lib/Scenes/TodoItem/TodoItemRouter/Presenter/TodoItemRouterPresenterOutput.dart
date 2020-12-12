//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

abstract class TodoItemRouterPresenterOutput  {}

class ShowViewReady extends TodoItemRouterPresenterOutput { final TodoItemStartMode startMode; ShowViewReady(this.startMode); }
class ShowMessageView extends TodoItemRouterPresenterOutput { final String message; ShowMessageView(this.message); }
class ShowDisplayView extends TodoItemRouterPresenterOutput {}
class ShowEditView extends TodoItemRouterPresenterOutput {}

