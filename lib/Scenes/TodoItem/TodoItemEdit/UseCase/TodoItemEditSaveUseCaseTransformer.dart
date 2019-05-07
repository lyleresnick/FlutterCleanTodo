//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/Managers/TodoValues.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';

import '../../TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

import 'TodoItemEditUseCaseOutput.dart';
import 'TodoItemEditUseCase.dart';


class TodoItemEditSaveUseCaseTransformer {

    final TodoItemEditMode _editMode;
    final TodoManager _todoManager;
    final TodoItemUseCaseState _state;

    TodoItemEditSaveUseCaseTransformer(TodoItemEditMode editMode, TodoManager todoManager, TodoItemUseCaseState state)
      : _editMode = editMode,
        _todoManager = todoManager,
        _state = state;

    void transform(EditingTodo editingTodo, TodoItemEditSaveUseCaseOutput output) async {

        void completion(Result result) {

            if(result is SuccessResult) {
                _state.currentTodo = result.data;
                _state.itemChanged = true;

                output.presentSaveCompleted();
            }
            else if(result is FailureResult)
                assert(false, "Unresolved error: ${result.description}");
            else if(result is SemanticErrorResult)
                assert(false, "Unexpected Semantic error: reason ${result.reason}");
        }

        if(editingTodo.title != "") {

            switch(_editMode) {
            case TodoItemEditMode.create:
                completion(await _create(editingTodo));
                break;
            case TodoItemEditMode.update:
                completion(await _update(editingTodo));
                break;
            }
        }
        else {
            output.presentTitleIsEmpty();
        }
    }

    Future<Result> _create(EditingTodo editingTodo) async{
        return await _todoManager.create(
            values: _todoValuesFromEditingTodo(editingTodo));
    }

    Future<Result> _update(EditingTodo editingTodo) async {
        return await _todoManager.update(
            id: editingTodo.id,
            values: _todoValuesFromEditingTodo(editingTodo));
    }

    TodoValues _todoValuesFromEditingTodo(EditingTodo editingTodo) {

        final todoValues = TodoValues();
        todoValues.title = editingTodo.title;
        todoValues.note = editingTodo.note;
        todoValues.completeBy = editingTodo.completeBy;
        todoValues.priority = editingTodo.priority;
        todoValues.completed = editingTodo.completed;
        return todoValues;
    }


}