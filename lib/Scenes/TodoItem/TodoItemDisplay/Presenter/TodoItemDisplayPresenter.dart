//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/UseCase/TodoItemDisplayUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/UseCase/TodoItemDisplayUseCaseOutput.dart';
import 'TodoItemDisplayPresenterOutput.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';

import 'TodoItemDisplayRowViewModel.dart';

class TodoItemDisplayPresenter extends Bloc  {

    final TodoItemDisplayUseCase useCase;
    final TodoItemDisplayRouter router;
    final _controller = StreamController<TodoItemDisplayPresenterOutput>();
    Stream<TodoItemDisplayPresenterOutput> get stream => _controller.stream;
    List<TodoItemDisplayRowViewModel> _viewModelList;


    TodoItemDisplayPresenter({@required this.useCase, @required this.router}) {
        useCase.stream
                .listen((event) {
            if (event is PresentBegin) {
                _viewModelList = [];
            }
            else if (event is PresentString) {
                final fieldName = localizeString(fieldNameToString(event.field));
                _viewModelList.add(TodoItemDisplayRowViewModel(fieldName, event.value));
            }
            if (event is PresentBool) {
                final fieldName = localizeString(fieldNameToString(event.field));
                _viewModelList.add(TodoItemDisplayRowViewModel(fieldName, localizeString(event.value ? "yes" : "no")));
            }
            else if (event is PresentPriority) {
                final fieldName = localizeString(fieldNameToString(event.field));
                _viewModelList.add(TodoItemDisplayRowViewModel(fieldName, localizeString(priorityToString(event.value))));
            }
            else if (event is PresentDate) {
                final fieldName = localizeString(fieldNameToString(event.field));
                _viewModelList.add(TodoItemDisplayRowViewModel(fieldName, localizeDate(event.value)));
            }
            else if (event is PresentEnd) {
                _controller.sink.add(ShowFieldList(_viewModelList));
            }
        });
    }
    
    void eventViewReady() {
        useCase.eventViewReady();
    }

    void eventModeEdit() {
        router.routeEditView();
    }

    TodoItemDisplayRowViewModel row(int index) {
        return _viewModelList[index];
    }

    int get rowCount {
        return _viewModelList.length;
    }

    String get editLabel => localizeString("edit");

    @override
    void dispose() {
        useCase.dispose();
        _controller.close();
    }

}