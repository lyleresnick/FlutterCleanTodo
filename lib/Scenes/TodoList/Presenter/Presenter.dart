//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
class Presenter with StarterBloc<_PresenterOutput> {
  final UseCase _useCase;
  final Router _router;

  Presenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      switch (event) {
        case presentLoading():
          emit(showLoading());
        case presentModel(:final model):
          emit(showModel(ViewModel.fromPresentation(model)));
        case presentItemDetail():
          _router.routeShowItemDetail();
      }
    });
  }

  void eventShowCompleted(bool completed) {
    _useCase.eventShowCompleted(completed);
  }

  void eventCompleted(bool completed, int index) {
    _useCase.eventCompleted(completed, index);
  }

  void eventDelete(int index) {
    _useCase.eventDelete(index);
  }

  void eventCreate() {
    _useCase.eventCreate();
  }

  void eventItemSelected(int index) {
    _useCase.eventItemSelected(index);
  }

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
