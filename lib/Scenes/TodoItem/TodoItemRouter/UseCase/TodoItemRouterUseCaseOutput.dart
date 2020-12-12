//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';
import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListPresentationModel.dart';

abstract class TodoItemRouterUseCaseOutput {}

class PresentViewReady extends TodoItemRouterUseCaseOutput { final TodoItemStartMode startMode; PresentViewReady(this.startMode); }
class PresentNotFound extends TodoItemRouterUseCaseOutput { final String id; PresentNotFound(this.id); }
class PresentChanged extends TodoItemRouterUseCaseOutput { final TodoListPresentationModel item; PresentChanged(this.item); }

