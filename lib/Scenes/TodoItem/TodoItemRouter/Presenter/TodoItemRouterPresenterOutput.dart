//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

abstract class TodoItemRouterPresenterOutput  {}

class ShowViewReady extends TodoItemRouterPresenterOutput {}
class ShowMessageView extends TodoItemRouterPresenterOutput { final String message; ShowMessageView(this.message); }
class ShowDisplayView extends TodoItemRouterPresenterOutput {}
class ShowEditView extends TodoItemRouterPresenterOutput {}

