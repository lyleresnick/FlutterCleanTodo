//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';

import '../UseCase/TodoItemDisplayUseCase.dart';
import '../Router/TodoItemDisplayRouter.dart';
import 'TodoItemDisplayRowViewModel.dart';
import '../UseCase/TodoItemDisplayUseCaseOutput.dart';
import 'TodoItemDisplayPresenterOutput.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';

class TodoItemDisplayPresenter implements TodoItemDisplayUseCaseOutput {

    final TodoItemDisplayUseCase _useCase;
    TodoItemDisplayRouter _router;
    TodoItemDisplayPresenterOutput output;
    List<TodoItemDisplayRowViewModel> _viewModelList;


    TodoItemDisplayPresenter({TodoItemDisplayUseCase useCase, TodoItemDisplayRouter router})
            :_useCase = useCase, _router = router;


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


// TodoItemDisplayUseCaseOutput

    @override
    void presentBegin() {
        _viewModelList = <TodoItemDisplayRowViewModel>[];
    }

    @override
    void presentString(FieldName field, String value) {
        final fieldName = fieldNameToString(field);
        _viewModelList.add(TodoItemDisplayRowViewModel(localizeString(fieldName), value));
    }

    @override
    void presentDate(FieldName field, DateTime date) {
        presentString(field, localizeDate(date));
    }

    @override
    void presentBool(FieldName field, bool value) {
        presentString(field, localizeString(value ? "yes" : "no"));
    }

    @override
    void presentPriority(FieldName field, Priority value) {
        presentString(field, localizeString(priorityToString(value)));
    }

    @override
    void presentEnd() {
        output.show();
    }
}