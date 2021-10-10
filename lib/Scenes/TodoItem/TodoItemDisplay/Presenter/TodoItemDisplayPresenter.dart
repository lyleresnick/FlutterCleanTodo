//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/Router/TodoItemDisplayRouter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/UseCase/TodoItemDisplayUseCase.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemDisplay/UseCase/TodoItemDisplayUseCaseOutput.dart';
import 'TodoItemDisplayPresenterOutput.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';

import 'TodoItemDisplayRowViewModel.dart';

class TodoItemDisplayPresenter with StarterBloc<TodoItemDisplayPresenterOutput>  {

    final TodoItemDisplayUseCase _useCase;
    final TodoItemDisplayRouter _router;
    late List<TodoItemDisplayRowViewModel> _viewModelList;


    TodoItemDisplayPresenter(this._useCase, this._router) {
        _useCase.stream
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
                streamAdd(ShowFieldList(_viewModelList));
            }
        });
    }
    
    void eventViewReady() {
        _useCase.eventViewReady();
    }

    void eventModeEdit() {
        _router.routeEditView();
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
        _useCase.dispose();
        super.dispose();
    }

}