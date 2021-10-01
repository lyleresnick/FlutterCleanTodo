//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/Managers/TodoValues.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

import 'TodoItemEditUseCaseOutput.dart';
import 'TodoItemEditUseCase.dart';


class TodoItemEditSaveUseCaseTransformer {

    final TodoItemEditMode editMode;
    final TodoManager todoManager;
    final TodoItemUseCaseState state;

    TodoItemEditSaveUseCaseTransformer(this.editMode, this.todoManager, this.state);

    void transform(EditingTodo editingTodo, StreamSink<TodoItemEditUseCaseOutput> output) async {

        void completion(Result result) {

            if(result is SuccessResult) {
                state.currentTodo = result.data;
                state.itemChanged = true;

                output.add(PresentSaveCompleted());
            }
            else if(result is FailureResult)
                assert(false, "Unresolved error: ${result.description}");
            else if(result is DomainMatterResult)
                assert(false, "Unexpected Semantic error: reason ${result.reason}");
        }

        if(editingTodo.title != "") {

            switch(editMode) {
            case TodoItemEditMode.create:
                completion(await _create(editingTodo));
                break;
            case TodoItemEditMode.update:
                completion(await _update(editingTodo));
                break;
            }
        }
        else {
            output.add(PresentTitleIsEmpty());
        }
    }

    Future<Result> _create(EditingTodo editingTodo) async{
        return await todoManager.create(
            values: _todoValuesFromEditingTodo(editingTodo));
    }

    Future<Result> _update(EditingTodo editingTodo) async {
        return await todoManager.update(
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