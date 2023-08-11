//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

class Presenter with StarterBloc<PresenterOutput> {
  final UseCase _useCase;
  final Router _router;

  Presenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      switch (event) {
        case presentModel(:final model):
          emit(showModel(ViewModel.fromPresentation(model)));
        case presentItemDetail():
          _router.routeShowItemDetail();
      }
    });
  }

  void eventCompleted(int index) {
    _useCase.eventCompleted(true, index);
  }

  void eventNotCompleted(int index) {
    _useCase.eventCompleted(false, index);
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
