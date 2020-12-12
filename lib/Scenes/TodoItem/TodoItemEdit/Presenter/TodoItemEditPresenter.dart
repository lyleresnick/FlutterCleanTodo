//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Router/TodoItemEditRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCaseOutput.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/View/TodoItemEditScene.dart';

import 'TodoItemEditViewModel.dart';
import 'TodoItemEditPresenterOutput.dart';

class TodoItemEditPresenter extends Bloc {

    final TodoItemEditUseCase useCase;
    final TodoItemEditRouter router;
    BuildContext buildContext;

    final _controller = StreamController<TodoItemEditPresenterOutput>();
    get stream => _controller.stream;

    TodoItemEditPresenter({@required this.useCase, @required this.router}) {

        useCase.stream
            .listen((event) {
                if (event is PresentModel) {
                    _controller.sink.add(ShowModel(TodoItemEditViewModel.fromModel(event.model)));
                }
                else if (event is PresentSaveCompleted) {
                    router.routeSaveCompleted();
                }
                else if (event is PresentEnableEditCompleteBy) {
                    TodoItemEditScene.showEnableEditCompleteBy(this, event.completeBy);
                }
                else if (event is PresentTitleIsEmpty) {
                    TodoItemEditScene.showTitleIsEmpty(this);
                }
            });
    }

    void eventViewReady() {
        useCase.eventViewReady();
    }

    void eventEditedTitle(String title) {
        useCase.eventEditedTitle(title);
    }

    void eventEditedNote(String note) {
        useCase.eventEditedNote(note);
    }

    void eventCompleteByClear() {
        useCase.eventCompleteByClear();
    }

    void eventCompleteByToday() {
        useCase.eventCompleteByToday();
    }

    void eventEnableEditCompleteBy(BuildContext context) {
        buildContext = context;
        useCase.eventEnableEditCompleteBy();
    }

    void eventEditedCompleteBy(DateTime completeBy) {
        useCase.eventEditedCompleteBy(completeBy);
    }

    void eventCompleted(bool completed) {
        useCase.eventCompleted(completed);
    }

    void eventEditedPriority(int index) {
    
        final priority = priorityFromBangs(index);
        useCase.eventEditedPriority(priority);
    }

    void eventSave(BuildContext context) {
        buildContext = context;
        useCase.eventSave();
    }

    void eventCancel() {
        router.routeEditingCancelled();
    }

    @override
    void dispose() {
        useCase.dispose();
        _controller.close();
    }

}


