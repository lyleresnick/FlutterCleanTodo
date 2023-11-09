//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoRootRouter.dart';

@visibleForTesting
class Presenter with StarterBloc<PresenterOutput>
    implements TodoItemRouter.Router, TodoList.Router {

//    TodoItemRouterRouter

  void routeCreateItemCancelled() {
    emit(PresenterOutput.showPop);
  }

  @override
  void routeItemPop() {
    emit(PresenterOutput.showPop);
  }

// TodoListRouter

  @override
  void routeShowItemDetail() {
    emit(PresenterOutput.showRowDetail);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
