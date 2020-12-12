//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:flutter_todo/Entities/Priority.dart';
import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditPresentationModel.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';
import 'package:flutter_todo/Entities/Todo.dart';

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

class TodoItemEditUseCase extends Bloc {

    final _controller = StreamController<TodoItemEditUseCaseOutput>();
    Stream<TodoItemEditUseCaseOutput> get stream => _controller.stream;

    EditingTodo _editingTodo;
    final TodoItemEditMode editMode;

    final EntityGateway entityGateway;
    final TodoItemUseCaseState useCaseState;

    TodoItemEditUseCase({@required this.entityGateway, @required this.useCaseState, @required this.editMode});

    void eventViewReady() {

        final transformer = TodoItemEditViewReadyUseCaseTransformer(editMode, useCaseState);
        _editingTodo = transformer.transform(_controller.sink);
    }

    void eventEditedTitle(String title) {
        _editingTodo.title = title;
    }

    void eventEditedNote(String note) {
        _editingTodo.note = note;
    }

    void eventCompleteByClear() {
        _editingTodo.completeBy = null;
        _controller.sink.add(PresentModel(TodoItemEditPresentationModel.fromEditingTodo(_editingTodo)));
    }

    void eventCompleteByToday() {
        _editingTodo.completeBy = DateTime.now();
        _controller.sink.add(PresentModel(TodoItemEditPresentationModel.fromEditingTodo(_editingTodo)));
    }

    void eventEnableEditCompleteBy() {
        _controller.sink.add(PresentEnableEditCompleteBy(_editingTodo.completeBy));
    }

    void eventEditedCompleteBy(DateTime completeBy) {
        _editingTodo.completeBy = completeBy;
        _controller.sink.add(PresentModel(TodoItemEditPresentationModel.fromEditingTodo(_editingTodo)));
    }

    void eventCompleted(bool completed) {
        _editingTodo.completed = completed;
    }

    void eventEditedPriority(Priority priority) {
        _editingTodo.priority = priority;
    }

    void eventSave() {

        final transformer = TodoItemEditSaveUseCaseTransformer(editMode, entityGateway.todoManager, useCaseState);
        transformer.transform(_editingTodo, _controller.sink);
    }

    @override
    void dispose() {
        _controller.close();
    }

}
