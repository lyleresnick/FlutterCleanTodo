//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

import 'TodoItemRouterUseCaseOutput.dart';
import 'TodoItemUseCaseState.dart';

class TodoItemRouterViewReadyUseCaseTransformer {

    final TodoManager todoManager;
    final TodoItemUseCaseState state;

    TodoItemRouterViewReadyUseCaseTransformer(this.todoManager, this.state);

    void transform({TodoItemStartMode startMode, StreamSink<TodoItemRouterUseCaseOutput> output}) {

        switch(startMode.runtimeType) {
        case TodoItemStartModeCreate:
            _startCreate(startMode, output);
            break;
        case TodoItemStartModeUpdate:
            _startUpdate(startMode, output);
            break;
        default:
              assert(false, "startMode.runtimeType is not defined" );
        }
    }

    void _startCreate(TodoItemStartModeCreate startMode, StreamSink<TodoItemRouterUseCaseOutput> output) {

        state.currentTodo = null;
        output.add(PresentViewReady(startMode));
    }

    void _startUpdate(TodoItemStartModeUpdate startMode, StreamSink<TodoItemRouterUseCaseOutput> output) async {

        final result = await todoManager.fetch(id: startMode.id);

        if(result is SuccessResult) {
            state.currentTodo = result.data;
            output.add(PresentViewReady(startMode));
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is SemanticErrorResult) {
            switch (result.reason) {
                case TodoErrorReason.notFound:
                    output.add(PresentNotFound(startMode.id));
                    break;
                default:
                    assert(false, "Unexpected Semantic error: reason ${result.reason}");
            }
        }
    }
}