//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

abstract class TodoItemRouterUseCaseOutput {}

class PresentEditView extends TodoItemRouterUseCaseOutput {}
class PresentDisplayView extends TodoItemRouterUseCaseOutput {}
class PresentNotFound extends TodoItemRouterUseCaseOutput { final String id; PresentNotFound(this.id); }

