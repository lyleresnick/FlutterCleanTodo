//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';
import '../../TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

import 'TodoItemEditUseCaseOutput.dart';
import 'TodoItemEditUseCase.dart';
import 'TodoItemEditPresentationModel.dart';


class TodoItemEditViewReadyUseCaseTransformer {

    final TodoItemEditMode _editMode;
    final TodoItemUseCaseState _state;

    TodoItemEditViewReadyUseCaseTransformer(TodoItemEditMode editMode, TodoItemUseCaseState state )
        : _editMode = editMode,
          _state = state;

    EditingTodo transform(TodoItemEditViewReadyUseCaseOutput output)  {

        switch(_editMode) {
        case TodoItemEditMode.update:
            output.presentModel(TodoItemEditPresentationModel.fromEntity(_state.currentTodo));
            return EditingTodo.fromTodo( _state.currentTodo);
        case TodoItemEditMode.create:
            output.presentNewModel();
            return EditingTodo();
        default:
            return null;
        }
    }
}
