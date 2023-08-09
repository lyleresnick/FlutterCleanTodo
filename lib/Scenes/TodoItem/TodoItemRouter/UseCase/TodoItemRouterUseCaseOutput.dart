//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

sealed class TodoItemRouterUseCaseOutput {}

class presentEditView extends TodoItemRouterUseCaseOutput {}

class presentDisplayView extends TodoItemRouterUseCaseOutput {}

class presentNotFound extends TodoItemRouterUseCaseOutput {
  final String id;
  presentNotFound(this.id);
}
