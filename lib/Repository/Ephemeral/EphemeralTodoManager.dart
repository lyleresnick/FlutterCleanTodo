//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:uuid/uuid.dart';

import '../Abstraction/TodoManager.dart';
import '../Abstraction/Result.dart';
import '../Abstraction/TodoValues.dart';
import '../Entities/Todo.dart';
import 'EphemeralData.dart';
import 'EphemeralTodo.dart';


class EphemeralTodoManager extends TodoManager {

    Future<Result<List<Todo>>> all() => Future.value(success(TodoEphemeralData.data.map((testTodo) => testTodo.toTodo).toList()));

    Future<Result<Todo>> completed(String id, bool completed) {
        try {
            final todo = _findTodo(id);
            todo.completed = completed;
            return Future.value(success(todo.toTodo));
        }
        catch (reason) {
            return Future.value(failure(reason.toString()));
        }
    }

    Future<Result<Todo>> create(TodoValues values) {
        final todo = EphemeralTodo.fromTodoValues(Uuid().v1(), values);
        TodoEphemeralData.data.add(todo);
        return Future.value(success(todo.toTodo));
    }

    Future<Result<Todo>> update(String id, TodoValues values) {

        try {
            final testTodo = _findTodo(id);
            testTodo.fromValues(values);
            return Future.value(success(testTodo.toTodo));
        }
        catch (reason) {
            return Future.value(failure(reason.toString()));
        }
    }

    Future<Result<Todo>> fetch(String id) {
        try {
            final testTodo = _findTodo(id);
            return Future.value(success(testTodo.toTodo));
        }
        catch (reason) {
            return Future.value(failure(reason.toString()));
        }
    }

    Future<Result<Todo>> delete(String id) {

        try {
            final index = _findTodoIndex(id);
            final testTodo = TodoEphemeralData.data[index];
            TodoEphemeralData.data.remove(index);
            return Future.value(success(testTodo.toTodo));
        }
        catch (reason) {
            return Future.value(failure(reason.toString()));
        }
    }


    EphemeralTodo _findTodo(String id) {
        for(final entity in TodoEphemeralData.data) {
            if(entity.id == id) {
                return entity;
            }
        }
        throw "id $id not found";
    }

    int _findTodoIndex(String id) {
        int index = 0;
        for (final entity in TodoEphemeralData.data) {
            if(entity.id == id) {
                return index;
            }
            index++;
        }
        throw "id $id not found";
    }
}

