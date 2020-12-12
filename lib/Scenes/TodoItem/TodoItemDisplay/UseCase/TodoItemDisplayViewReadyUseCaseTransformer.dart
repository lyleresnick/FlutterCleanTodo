//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';
import 'TodoItemDisplayUseCaseOutput.dart';

class TodoItemDisplayViewReadyUseCaseTransformer {

    final TodoItemUseCaseState state;

    TodoItemDisplayViewReadyUseCaseTransformer(this.state);

    void transform(StreamSink<TodoItemDisplayUseCaseOutput> output)  {

        final todo = state.currentTodo;
        output.add(PresentBegin());

        output.add(PresentString(FieldName.title, todo.title));
        if( todo.note != "" ) {
            output.add(PresentString(FieldName.note, todo.note));
        }
        if (todo.completeBy != null) {
            output.add(PresentDate(FieldName.completeBy, todo.completeBy));
        }
        switch(todo.priority) {
        case Priority.none:
            break;
        default:
            output.add(PresentPriority(FieldName.priority, todo.priority));
        }
        output.add(PresentBool(FieldName.completed, todo.completed));
        output.add(PresentEnd());
    }
}
