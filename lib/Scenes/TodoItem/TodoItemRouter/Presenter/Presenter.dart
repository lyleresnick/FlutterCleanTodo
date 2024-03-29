//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

@visibleForTesting
class Presenter
    with StarterBloc<_PresenterOutput>
    implements TodoItemDisplay.Router, TodoItemEdit.Router {
  final UseCase _useCase;
  final Router router;

  Presenter(this._useCase, this.router) {
    _useCase.stream.listen((event) {
      switch(event) {
        case presentLoading():
          emit(showLoading());
        case presentDisplayView():
          emit(showDisplayView());
      case presentEditView():
        emit(showEditView());
      case presentNotFound(:final id):
        final message = localizedString("todoNotFound");
        //final message = String(format: messageFormat, id)
        emit(showMessageView(message + ' ' + id));
    }
    });
  }

//  TodoItemDisplayRouter

  @override
  void routeEditView() {
    emit(showEditView());
  }

//  TodoItemEditRouter

  @override
  void routeSaveCompleted() {
    emit(showDisplayView());
  }

  @override
  void routeEditingCancelled() {
    emit(showDisplayView());
  }

  @override
  void routeCreateCancelled() {
    router.routeCreateItemCancelled();
  }

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
