//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';

import 'TodoItemDisplayUseCaseOutput.dart';

class TodoItemDisplayUseCase with StarterBloc<TodoItemDisplayUseCaseOutput> {

    TodoAppState _appState;

    TodoItemDisplayUseCase(this._appState);

    void eventViewReady() {
        final todo = _appState.itemState.currentTodo;
        emit(presentBegin());

        emit(presentString(FieldName.title, todo.title));
        if( todo.note != "" ) {
            emit(presentString(FieldName.note, todo.note));
        }
        final completeBy = todo.completeBy;
        if (completeBy != null) {
            emit(presentDate(FieldName.completeBy, completeBy));
        }
        switch(todo.priority) {
            case Priority.none:
                break;
            default:
                emit(presentPriority(FieldName.priority, todo.priority));
        }
        emit(presentBool(FieldName.completed, todo.completed));
        emit(presentEnd());
    }

    @override
    void dispose() {
        super.dispose();
    }

}
