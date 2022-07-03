//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';

import 'TodoItemEditViewModel.dart';
import 'TodoItemEditPresenterOutput.dart';

class TodoItemEditPresenter with StarterBloc<TodoItemEditPresenterOutput> {
  final TodoItemEditUseCase _useCase;
  final TodoItemEditRouter _router;

  TodoItemEditPresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      event.when(
          presentModel: (model) {
            streamAdd(TodoItemEditPresenterOutput.showModel(
                TodoItemEditViewModel.fromModel(model)));
          },
          presentSaveCompleted: _router.routeSaveCompleted,
          presentCreateCancelled: _router.routeCreateCancelled,
          presentEditingCancelled: _router.routeEditingCancelled);
    });
  }

  void eventViewReady() {
    _useCase.eventViewReady();
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
