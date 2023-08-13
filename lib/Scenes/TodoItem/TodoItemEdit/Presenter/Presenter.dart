//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

@visibleForTesting
class Presenter with StarterBloc<_PresenterOutput> {
  final UseCase _useCase;
  final Router _router;

  Presenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      switch(event) {
        case presentModel(:final model):
          emit(showModel(ViewModel.fromModel(model)));
        case presentSaveCompleted():
          _router.routeSaveCompleted();
        case presentCreateCancelled():
          _router.routeCreateCancelled();
        case presentEditingCancelled():
          _router.routeEditingCancelled();
      }
    });
  }

  void eventEditedTitle(String title) {
    _useCase.eventEditedTitle(title);
  }

  void eventEditedNote(String note) {
    _useCase.eventEditedNote(note);
  }

  void eventCompleteByClear() {
    _useCase.eventCompleteByClear();
  }

  void eventCompleteByToday() {
    _useCase.eventCompleteByToday();
  }

  void eventEnableEditCompleteBy() {
    _useCase.eventEnableEditCompleteBy();
  }

  void eventEditedCompleteBy(DateTime completeBy) {
    _useCase.eventEditedCompleteBy(completeBy);
  }

  void eventCompleted(bool completed) {
    _useCase.eventCompleted(completed);
  }

  void eventEditedPriority(int? index) {
    final priority = priorityFromBangs(index!);
    _useCase.eventEditedPriority(priority);
  }

  void eventSave() {
    _useCase.eventSave();
  }

  void eventCancel() {
    _useCase.eventCancel();
  }

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
