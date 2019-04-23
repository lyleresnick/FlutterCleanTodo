//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../../Managers/TodoManager.dart';
import '../../../Managers/Result.dart';
import 'TodoItemRouterUseCaseOutput.dart';
import 'TodoItemUseCaseState.dart';
import '../TodoItemStartMode.dart';

class TodoItemRouterViewReadyUseCaseTransformer {

    final TodoManager _todoManager;
    final TodoItemUseCaseState _state;

    TodoItemRouterViewReadyUseCaseTransformer(TodoManager todoManager,
            TodoItemUseCaseState state)
          :  _todoManager = todoManager,
            _state = state;

    void transform({TodoStartMode startMode, TodoItemRouterViewReadyUseCaseOutput output})  {

        switch(startMode.runtimeType) {
        case TodoStartModeCreate:
            _startCreate(startMode, output);
            break;
        case TodoStartModeUpdate:
            _startUpdate(startMode, output);
            break;
        }
    }

    void _startCreate(TodoStartModeCreate startMode, TodoItemRouterViewReadyUseCaseOutput output) {

        _state.currentTodo = null;
        output.presentViewReady(startMode);
    }

    void _startUpdate(TodoStartModeUpdate startMode, TodoItemRouterViewReadyUseCaseOutput output) {

        output.presentTitle();
        _todoManager.fetch(id: startMode.id, completion: (result) {

            switch(result.runtimeType) {
                case ResultSuccess:
                    ResultSuccess entity = result;
                    _state.currentTodo = entity.data;
                    output.presentViewReady(startMode);
                    break;
                case ResultFailure:
                    ResultFailure failure = result;
                    assert(false, "Unresolved error: ${failure.description}");
                    break;
                case ResultSemanticError:
                    ResultSemanticError semanticError = result;
                    switch(semanticError.reason) {
                        case TodoErrorReason.notFound:
                            output.presentNotFound(startMode.id);
                            break;
                        default:
                            assert(false, "semanticError ${semanticError.reason} has not been processed!");
                    }
                    break;
            }
        });
    }
}