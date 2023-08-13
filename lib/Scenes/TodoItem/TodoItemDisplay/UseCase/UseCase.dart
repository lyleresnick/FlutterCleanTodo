//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

@visibleForTesting
class UseCase with StarterBloc<_UseCaseOutput> {

    TodoAppState _appState;

    UseCase(this._appState) {
        final todo = _appState.currentTodo!;
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
