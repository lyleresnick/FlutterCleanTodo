//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';

import 'TodoItemDisplayUseCaseOutput.dart';

class TodoItemDisplayUseCase extends Bloc {

    final _controller = StreamController<TodoItemDisplayUseCaseOutput>();
    Stream<TodoItemDisplayUseCaseOutput> get stream => _controller.stream;
    TodoAppState _appState;

    TodoItemDisplayUseCase(this._appState);

    void eventViewReady() {
        final todo = _appState.itemState.currentTodo;
        _controller.sink.add(PresentBegin());

        _controller.sink.add(PresentString(FieldName.title, todo.title));
        if( todo.note != "" ) {
            _controller.sink.add(PresentString(FieldName.note, todo.note));
        }
        if (todo.completeBy != null) {
            _controller.sink.add(PresentDate(FieldName.completeBy, todo.completeBy));
        }
        switch(todo.priority) {
            case Priority.none:
                break;
            default:
                _controller.sink.add(PresentPriority(FieldName.priority, todo.priority));
        }
        _controller.sink.add(PresentBool(FieldName.completed, todo.completed));
        _controller.sink.add(PresentEnd());
    }

    @override
    void dispose() {
        _controller.close();
    }

}
