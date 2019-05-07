//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/Managers/Result.dart';

import '../../TodoItemStartMode.dart';

import 'TodoItemRouterUseCaseOutput.dart';
import 'TodoItemUseCaseState.dart';

class TodoItemRouterViewReadyUseCaseTransformer {

    final TodoManager _todoManager;
    final TodoItemUseCaseState _state;

    TodoItemRouterViewReadyUseCaseTransformer(TodoManager todoManager,
            TodoItemUseCaseState state)
          :  _todoManager = todoManager,
            _state = state;

    void transform({TodoItemStartMode startMode, TodoItemRouterViewReadyUseCaseOutput output}) {

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

    void _startCreate(TodoItemStartModeCreate startMode, TodoItemRouterViewReadyUseCaseOutput output) {

        _state.currentTodo = null;
        output.presentViewReady(startMode);
    }

    void _startUpdate(TodoItemStartModeUpdate startMode, TodoItemRouterViewReadyUseCaseOutput output) async {

        final result = await _todoManager.fetch(id: startMode.id);

        if(result is SuccessResult) {
            _state.currentTodo = result.data;
            output.presentViewReady(startMode);
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is SemanticErrorResult) {
            switch (result.reason) {
                case TodoErrorReason.notFound:
                    output.presentNotFound(startMode.id);
                    break;
                default:
                    assert(false, "Unexpected Semantic error: reason ${result
                            .reason}");
            }
        }
    }
}