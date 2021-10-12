
import 'TestTodo.dart';
import 'TodoManager.dart';
import '../Entities/Todo.dart';
import 'TodoValues.dart';
import 'TodoTestData.dart';
import 'package:uuid/uuid.dart';
import 'Result.dart';


class TestTodoManager extends TodoManager {

    Future<Result<List<Todo>, TodoDomainReason>> all() => Future.value(Result.success(TodoTestData.data.map((testTodo) => testTodo.toTodo).toList()));

    Future<Result<Todo, TodoDomainReason>> completed(String id, bool completed) {
        try {
            final todo = _findTodo(id);
            todo.completed = completed;
            return Future.value(Result.success(todo.toTodo));
        }
        on TodoDomainReason catch (reason) {
            return Future.value(Result.domainIssue(reason));
        }
    }

    Future<Result<Todo, TodoDomainReason>> create(TodoValues values) {
        final todo = TestTodo.fromTodoValues(Uuid().v1(), values);
        TodoTestData.data.add(todo);
        return Future.value(Result.success(todo.toTodo));
    }

    Future<Result<Todo, TodoDomainReason>> update(String id, TodoValues values) {

        try {
            final testTodo = _findTodo(id);
            testTodo.setValues(values);
            return Future.value(Result.success(testTodo.toTodo));
        }
        on TodoDomainReason catch (reason) {
            return Future.value(Result.domainIssue(reason));
        }
    }

    Future<Result<Todo, TodoDomainReason>> fetch(String id) {
        try {
            final testTodo = _findTodo(id);
            return Future.value(Result.success(testTodo.toTodo));
        }
        on TodoDomainReason catch (reason) {
            return Future.value(Result.domainIssue(reason));
        }
    }

    Future<Result<Todo, TodoDomainReason>> delete(String id) {

        try {
            final index = _findTodoIndex(id);
            final testTodo = TodoTestData.data[index];
            TodoTestData.data.remove(index);
            return Future.value(Result.success(testTodo.toTodo));
        }
        on TodoDomainReason catch (reason) {
            return Future.value(Result.domainIssue(reason));
        }
    }


    TestTodo _findTodo(String id) {
        for(final entity in TodoTestData.data) {
            if(entity.id == id) {
                return entity;
            }
        }
        throw TodoDomainReason.notFound;
    }

    int _findTodoIndex(String id) {
        int index = 0;
        for (final entity in TodoTestData.data) {
            if(entity.id == id) {
                return index;
            }
            index++;
        }
        throw TodoDomainReason.notFound;
    }
}

