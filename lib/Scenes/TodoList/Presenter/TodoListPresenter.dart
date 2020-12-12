//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/TodoList/Router/TodoListRouter.dart';
import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListUseCase.dart';
import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListUseCaseOutput.dart';

import 'TodoListRowViewModel.dart';
import 'TodoListPresenterOutput.dart';

class TodoListPresenter extends Bloc {

    final TodoListUseCase useCase;
    final TodoListRouter router;
    final _controller = StreamController<TodoListPresenterOutput>();
    Stream<TodoListPresenterOutput> get stream => _controller.stream;

    List<TodoListRowViewModel> _viewModelList = [];

    TodoListPresenter({@required this.useCase, @required this.router}) {
        useCase.stream
            .listen((event) {
                if (event is PresentBegin) {
                    _viewModelList = [];
                }
                else if (event is PresentItem) {
                    _viewModelList.add(TodoListRowViewModel(event.model));
                }
                else if (event is PresentEnd) {
                    _controller.sink.add(ShowTodoList(_viewModelList));
                }
                else if (event is PresentCompleted) {
                    _viewModelList[event.index] = TodoListRowViewModel(event.model);
                    _controller.sink.add(ShowTodoList(_viewModelList));
                }
                else if (event is PresentDeleted) {
                    _viewModelList.removeAt(event.index);
                    _controller.sink.add(ShowTodoList(_viewModelList));
                }
                else if (event is PresentUndoDeleted) {
                    _controller.sink.add(ShowTodoList(_viewModelList));
                }
            });
    }

    String get titleLabel => localizeString("todoList");

    void eventViewReady() {
        useCase.eventViewReady();
    }

    void eventCompleted(int index) {
        useCase.eventCompleted(true, index, _viewModelList[index].id);
    }

    void eventNotCompleted(int index) {
        useCase.eventCompleted(false, index, _viewModelList[index].id);
    }

    void eventDelete(int index) {
        useCase.eventDelete(index, _viewModelList[index].id);
    }

    void eventCreate() {

        router.routeCreateItem((model) {

            _viewModelList.add(TodoListRowViewModel(model));
            _controller.sink.add(ShowTodoList(_viewModelList));
        });
    }

    void eventItemSelected(int index) {

        router.routeDisplayItem(_viewModelList[index].id, (model) {

            _viewModelList[index] = TodoListRowViewModel(model);
            _controller.sink.add(ShowTodoList(_viewModelList));
        });
    }

    @override
    void dispose() {
        useCase.dispose();
        _controller.close();
    }
}
