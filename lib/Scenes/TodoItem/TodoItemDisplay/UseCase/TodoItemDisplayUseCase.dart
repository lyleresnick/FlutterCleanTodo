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
        streamAdd(TodoItemDisplayUseCaseOutput.presentBegin());

        streamAdd(TodoItemDisplayUseCaseOutput.presentString(FieldName.title, todo.title));
        if( todo.note != "" ) {
            streamAdd(TodoItemDisplayUseCaseOutput.presentString(FieldName.note, todo.note));
        }
        final completeBy = todo.completeBy;
        if (completeBy != null) {
            streamAdd(TodoItemDisplayUseCaseOutput.presentDate(FieldName.completeBy, completeBy));
        }
        switch(todo.priority) {
            case Priority.none:
                break;
            default:
                streamAdd(TodoItemDisplayUseCaseOutput.presentPriority(FieldName.priority, todo.priority));
        }
        streamAdd(TodoItemDisplayUseCaseOutput.presentBool(FieldName.completed, todo.completed));
        streamAdd(TodoItemDisplayUseCaseOutput.presentEnd());
    }

    @override
    void dispose() {
        super.dispose();
    }

}
