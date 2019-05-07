//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/foundation.dart';

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';

import '../UseCase/TodoItemEditUseCase.dart';
import '../UseCase/TodoItemEditUseCaseOutput.dart';
import '../UseCase/TodoItemEditPresentationModel.dart';
import '../Router/TodoItemEditRouter.dart';

import 'TodoItemEditViewModel.dart';
import 'TodoItemEditPresenterOutput.dart';

class TodoItemEditPresenter implements TodoItemEditUseCaseOutput {

    final TodoItemEditUseCase _useCase;
    final TodoItemEditRouter _router;

    TodoItemEditPresenterOutput output;

    TodoItemEditPresenter({@required TodoItemEditUseCase useCase, @required TodoItemEditRouter router})
      : _useCase = useCase,
        _router = router ;
    
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

    void eventEditedPriority(int index) {
    
        final priority = priorityFromBangs(index);
        _useCase.eventEditedPriority(priority);
    }

    void eventSave() {
        _useCase.eventSave();
    }

    void eventCancel() {
        _router.routeEditingCancelled();
    }

    String get saveLabel => localizeString("save");
    String get titleLabel => localizeString("title");
    String get noteLabel => localizeString("note");
    String get completeByLabel => localizeString("completeBy");
    String get priorityLabel => localizeString("priority");
    String get completedLabel => localizeString("completed");
    String get setLabel => localizeString("set");


    // TodoItemEditUseCaseOutput
    
    // TodoItemEditViewReadyUseCaseOutput
    
    void presentModel(TodoItemEditPresentationModel model) {
        presentWithLocalizations(TodoItemEditViewModel.fromModel(model));
    }

    void presentNewModel() {
        presentWithLocalizations(TodoItemEditViewModel());
    }

    void presentWithLocalizations(TodoItemEditViewModel model) {
        output.showModel(model,
                localizeString("enterATitle"),
                ["none", "low", "medium", "high"].map((value) => localizeString(value)).toList()
        );
    }

// TodoItemEditCompleteByUseCaseOutput

    void presentCompleteByClear() {
        output.showCompleteByClear();
    }

    void presentEnableEditCompleteBy(DateTime completeBy) {
        output.showEnableEditCompleteBy(completeBy);
    }

    void presentCompleteBy(DateTime completeBy) {
    
        output.showCompleteBy( (completeBy != null)
            ? localizeDate(completeBy)
            : "");
    }

    // TodoItemEditSaveUseCaseOutput

    void presentSaveCompleted() {
        _router.routeSaveCompleted();
    }

    void presentTitleIsEmpty() {
        output.showTitleIsEmpty(localizeString("titleRequiredTitle"), localizeString("titleRequiredMessage"));
    }
}


