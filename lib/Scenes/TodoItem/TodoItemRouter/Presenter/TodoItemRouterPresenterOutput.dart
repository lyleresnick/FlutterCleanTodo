//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

sealed class TodoItemRouterPresenterOutput {}

class showEditView extends TodoItemRouterPresenterOutput {}

class showDisplayView extends TodoItemRouterPresenterOutput {}

class showMessageView extends TodoItemRouterPresenterOutput {
  final String id;
  showMessageView(this.id);
}
