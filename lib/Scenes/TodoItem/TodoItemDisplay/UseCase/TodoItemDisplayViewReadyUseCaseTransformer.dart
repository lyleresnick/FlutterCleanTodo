//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';
import '../../TodoItemRouter/UseCase/TodoItemUseCaseState.dart';
import 'TodoItemDisplayUseCaseOutput.dart';

class TodoItemDisplayViewReadyUseCaseTransformer {

    final TodoItemUseCaseState state;

    TodoItemDisplayViewReadyUseCaseTransformer(this.state);

    void transform(TodoItemDisplayUseCaseOutput output)  {

        final todo = state.currentTodo;
        output.presentBegin();

        output.presentString(FieldName.title, todo.title);
        if( todo.note != "" ) {
            output.presentString(FieldName.note, todo.note);
        }
        if (todo.completeBy != null) {
            output.presentDate(FieldName.completeBy, todo.completeBy);
        }
        switch(todo.priority) {
        case Priority.none:
            break;
        default:
            output.presentPriority(FieldName.priority, todo.priority);
        }
        output.presentBool(FieldName.completed, todo.completed);
        output.presentEnd();
    }
}
