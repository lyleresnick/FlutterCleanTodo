//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/Entities/Priority.dart';

class TodoItemEditPresentationModel {

    final String title;
    final String note;
    DateTime _completeBy;
    final int priority;
    bool completed;

    TodoItemEditPresentationModel({
        @required this.title,
        @required this.note,
        DateTime completeBy,
        @required this.priority,
        @required this.completed
    }) : _completeBy = completeBy;

    DateTime get completeBy => _completeBy;

    factory TodoItemEditPresentationModel.fromEntity(Todo entity) {
        return TodoItemEditPresentationModel(
            title: entity.title,
            note: entity.note,
            completeBy: entity.completeBy,
            priority: bangsFromPriority(entity.priority),
            completed: entity.completed
        );
    }

    factory TodoItemEditPresentationModel.fromEditingTodo(EditingTodo editingTodo) {
        return TodoItemEditPresentationModel(
                title: editingTodo.title,
                note: editingTodo.note,
                completeBy: editingTodo.completeBy,
                priority: bangsFromPriority(editingTodo.priority),
                completed: editingTodo.completed
        );
    }

}
