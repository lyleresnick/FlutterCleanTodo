//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';
import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListPresentationModel.dart';

import 'TodoItemRouterUseCaseOutput.dart';
import 'TodoItemUseCaseState.dart';

class TodoItemRouterUseCase extends Bloc{

    final _controller = StreamController<TodoItemRouterUseCaseOutput>();
    Stream<TodoItemRouterUseCaseOutput> get stream => _controller.stream;

    final EntityGateway _entityGateway;
    final TodoItemUseCaseState _useCaseState;

    TodoItemRouterUseCase(this._entityGateway, this._useCaseState);

    void eventViewReady({TodoItemStartMode startMode}) {

        switch(startMode.runtimeType) {
            case TodoItemStartModeCreate:
                _startCreate(startMode, _controller.sink);
                break;
            case TodoItemStartModeUpdate:
                _startUpdate(startMode, _controller.sink);
                break;
            default:
                assert(false, "startMode.runtimeType is not defined" );
        }
    }

    void _startCreate(TodoItemStartModeCreate startMode, StreamSink<TodoItemRouterUseCaseOutput> output) {
        _useCaseState.currentTodo = null;
        output.add(PresentViewReady(startMode));
    }

    void _startUpdate(TodoItemStartModeUpdate startMode, StreamSink<TodoItemRouterUseCaseOutput> output) async {

        final result = await _entityGateway.todoManager.fetch(id: startMode.id);
        if(result is SuccessResult) {
            _useCaseState.currentTodo = result.data;
            output.add(PresentViewReady(startMode));
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is DomainMatterResult) {
            switch (result.reason) {
                case TodoErrorReason.notFound:
                    output.add(PresentNotFound(startMode.id));
                    break;
                default:
                    assert(false, "Unexpected Semantic error: reason ${result.reason}");
            }
        }
    }

    void eventBack() {
        if(_useCaseState.itemChanged) {
            _controller.sink.add(PresentChanged(TodoListPresentationModel(_useCaseState.currentTodo)));
        }
    }

    @override
    void dispose() {
        _controller.close();
    }
}
