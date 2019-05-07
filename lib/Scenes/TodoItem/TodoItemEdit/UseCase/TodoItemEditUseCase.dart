//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/foundation.dart';

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';
import 'package:flutter_todo/UseCaseStore/UseCaseStore.dart';
import 'package:flutter_todo/UseCaseStore/RealUseCaseStore.dart';
import 'package:flutter_todo/Entities/Todo.dart';

import '../../TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

import 'TodoItemEditViewReadyUseCaseTransformer.dart';
import 'TodoItemEditSaveUseCaseTransformer.dart';
import 'TodoItemEditUseCaseOutput.dart';

class EditingTodo {


    String id;
    String title;
    String note;
    DateTime completeBy;
    Priority priority;
    bool completed;

    EditingTodo({
        this.id,
        this.title = "",
        this.note = "",
        this.completeBy,
        this.priority = Priority.none,
        this.completed = false
    });

    EditingTodo.fromTodo(Todo todo) {

        id = todo.id;
        title = todo.title;
        note = todo.note;
        completeBy = todo.completeBy;
        priority = todo.priority;
        completed = todo.completed;
    }
}

class TodoItemEditUseCase {

    TodoItemEditUseCaseOutput output;

    EditingTodo editingTodo;
    TodoItemEditMode _editMode;

    final EntityGateway _entityGateway;
    final UseCaseStore _useCaseStore;
    TodoItemUseCaseState _itemState;

    TodoItemEditUseCase({EntityGateway entityGateway, UseCaseStore useCaseStore, @required TodoItemEditMode editMode})
        : _entityGateway  = entityGateway ?? EntityGateway.entityGateway,
          _useCaseStore  = useCaseStore ?? RealUseCaseStore.store
    {
        _itemState = _useCaseStore.getObject(itemStateKey);
        _editMode = editMode;
    }

    void eventViewReady() {

        final transformer = TodoItemEditViewReadyUseCaseTransformer(_editMode, _itemState);
        editingTodo = transformer.transform(output);
    }

    // MARK: - Data Capture

    void eventEditedTitle(String title) {
    editingTodo.title = title;
    }

    void eventEditedNote(String note) {
        editingTodo.note = note;
    }

    void eventCompleteByClear() {
        editingTodo.completeBy = null;
        output.presentCompleteByClear();
    }

    void eventCompleteByToday() {
        editingTodo.completeBy = DateTime.now();
        output.presentCompleteBy(editingTodo.completeBy);
    }

    void eventEnableEditCompleteBy() {
        output.presentEnableEditCompleteBy(editingTodo.completeBy);
    }

    void eventEditedCompleteBy(DateTime completeBy) {
        editingTodo.completeBy = completeBy;
        output.presentCompleteBy(completeBy);
    }

    void eventCompleted(bool completed) {
        editingTodo.completed = completed;
    }

    void eventEditedPriority(Priority priority) {
        editingTodo.priority = priority;
    }

    // MARK: - Finalization

    void eventSave() {

        final transformer = TodoItemEditSaveUseCaseTransformer(_editMode, _entityGateway.todoManager, _itemState);
        transformer.transform(editingTodo, output);
    }
}
