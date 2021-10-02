//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

import 'TodoItemRouterUseCaseOutput.dart';
import '../../TodoItemState.dart';

class TodoItemRouterUseCase extends Bloc {

    final _controller = StreamController<TodoItemRouterUseCaseOutput>();
    Stream<TodoItemRouterUseCaseOutput> get stream => _controller.stream;

    final EntityGateway _entityGateway;
    final TodoAppState _appState;

    TodoItemRouterUseCase(this._entityGateway, this._appState) {
        _appState.itemState = TodoItemState();
    }

    void eventViewReady({TodoItemStartMode startMode}) {

        switch(_appState.itemStartMode.runtimeType) {
            case TodoItemStartModeCreate:
                _startCreate(_controller.sink);
                break;
            case TodoItemStartModeUpdate:
                _startUpdate(_controller.sink);
                break;
            default:
                assert(false, "startMode.runtimeType is not defined" );
        }
    }

    void _startCreate(StreamSink<TodoItemRouterUseCaseOutput> output) {
        output.add(PresentEditView());
    }

    void _startUpdate(StreamSink<TodoItemRouterUseCaseOutput> output) async {
        final startMode = _appState.itemStartMode as TodoItemStartModeUpdate;

        final result = await _entityGateway.todoManager.fetch(id: _appState.toDoList[startMode.index].id);
        if(result is SuccessResult) {
            _appState.itemState.currentTodo = result.data;
            output.add(PresentDisplayView());
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is DomainIssueResult) {
            switch (result.reason) {
                case TodoDomainReason.notFound:
                    output.add(PresentNotFound(_appState.toDoList[startMode.index].id));
                    break;
                default:
                    assert(false, "Unexpected Semantic error: reason ${result.reason}");
            }
        }
    }

    void eventBack() {
        if(_appState.itemState.itemChanged) {
            _appState.itemStartMode.todoListChangedItemCallback();
        }
    }

    @override
    void dispose() {
        _controller.close();
    }
}
