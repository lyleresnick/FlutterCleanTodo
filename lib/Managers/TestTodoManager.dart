import 'TodoManager.dart';
import '../Entities/Todo.dart';
import 'TodoValues.dart';
import '../TodoTestData.dart';
import 'package:uuid/uuid.dart';
import 'Result.dart';

class TestTodoManager extends TodoManager {

    Future<Result> all() => Future.value(SuccessResult(data: TodoTestData().data.toList())); // make copy

    Future<Result> completed(String id, bool completed) {
        try {
            final todo = _findTodo(id);
            todo.completed = completed;
            return Future.value(SuccessResult(data: todo));
        }
        on TodoDomainReason catch (reason) {
            return Future.value(DomainIssueResult(reason: reason));
        }
    }

    Future<Result> create(TodoValues values) {
        final todo = values.toTodo( id: Uuid().v1());
        TodoTestData().data.add(todo);
        return Future.value(SuccessResult(data: todo));
    }

    Future<Result> update(String id, TodoValues values) {

        try {
            final todo = _findTodo(id);
            values.setOn(todo: todo);
            return Future.value(SuccessResult(data: todo));
        }
        on TodoDomainReason catch (reason) {
            return Future.value(DomainIssueResult(reason: reason));
        }
    }

    Future<Result> fetch(String id) {
        try {
            final todo = _findTodo(id);
            return Future.value(SuccessResult(data: todo));
        }
        on TodoDomainReason catch (reason) {
            return Future.value(DomainIssueResult(reason: reason));
        }
    }

    Future<Result> delete(String id) {

        try {
            final index = _findTodoIndex(id);
            final todo = TodoTestData().data[index];
            TodoTestData().data.remove(index);
            return Future.value(SuccessResult(data: todo));
        }
        on TodoDomainReason catch (reason) {
            return Future.value(DomainIssueResult(reason: reason));
        }
    }


    Todo _findTodo(String id) {
        for(final entity in TodoTestData().data) {
            if(entity.id == id) {
                return entity;
            }
        }
        throw TodoDomainReason.notFound;
    }

    int _findTodoIndex(String id) {
        int index = 0;
        for (final entity in TodoTestData().data) {
            if(entity.id == id) {
                return index;
            }
            index++;
        }
        throw TodoDomainReason.notFound;
    }
}

