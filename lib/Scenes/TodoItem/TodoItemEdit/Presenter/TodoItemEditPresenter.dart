//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';
import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCaseOutput.dart';

import 'TodoItemEditViewModel.dart';
import 'TodoItemEditPresenterOutput.dart';

class TodoItemEditPresenter extends Bloc {

    final TodoItemEditUseCase _useCase;
    final TodoItemEditRouter _router;

    final _controller = StreamController<TodoItemEditPresenterOutput>();
    get stream => _controller.stream;

    TodoItemEditPresenter(this._useCase, this._router) {

        _useCase.stream
            .listen((event) {
                if (event is PresentModel) {
                    _controller.sink.add(ShowModel(TodoItemEditViewModel.fromModel(event.model)));
                }
                else if (event is PresentSaveCompleted) {
                    _router.routeSaveCompleted();
                }
                else if (event is PresentEditingCancelled) {
                    _router.routeEditingCancelled();
                }
                else if (event is PresentCreateCancelled) {
                    _router.routeCreateCancelled();
                }
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

    void eventEditedPriority(int index) {
    
        final priority = priorityFromBangs(index);
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
        _controller.close();
    }

}


