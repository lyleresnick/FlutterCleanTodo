//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

import 'TodoItemEditUseCaseOutput.dart';
import 'TodoItemEditUseCase.dart';
import 'TodoItemEditPresentationModel.dart';


class TodoItemEditViewReadyUseCaseTransformer {

    final TodoItemEditMode editMode;
    final TodoItemUseCaseState state;

    TodoItemEditViewReadyUseCaseTransformer(this.editMode, this.state );

    EditingTodo transform(StreamSink<TodoItemEditUseCaseOutput> output)  {

        switch(editMode) {
        case TodoItemEditMode.update:
            output.add(PresentModel(TodoItemEditPresentationModel.fromEntity(state.currentTodo)));
            return EditingTodo.fromTodo(state.currentTodo);
        case TodoItemEditMode.create:
            final editingTodo = EditingTodo();
            output.add(PresentModel(TodoItemEditPresentationModel.fromEditingTodo(editingTodo)));
            return editingTodo;
        default:
            return null;
        }
    }
}
