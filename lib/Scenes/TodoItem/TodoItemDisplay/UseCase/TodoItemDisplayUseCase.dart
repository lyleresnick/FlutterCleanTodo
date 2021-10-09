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
        streamAdd(PresentBegin());

        streamAdd(PresentString(FieldName.title, todo.title));
        if( todo.note != "" ) {
            streamAdd(PresentString(FieldName.note, todo.note));
        }
        if (todo.completeBy != null) {
            streamAdd(PresentDate(FieldName.completeBy, todo.completeBy));
        }
        switch(todo.priority) {
            case Priority.none:
                break;
            default:
                streamAdd(PresentPriority(FieldName.priority, todo.priority));
        }
        streamAdd(PresentBool(FieldName.completed, todo.completed));
        streamAdd(PresentEnd());
    }

    @override
    void dispose() {
        super.dispose();
    }

}
