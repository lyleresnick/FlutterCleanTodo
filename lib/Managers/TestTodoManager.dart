import 'TodoManager.dart';
import '../Entities/Todo.dart';
import 'TodoValues.dart';
import '../TodoTestData.dart';
import 'package:uuid/uuid.dart';
import 'Result.dart';

class TestTodoManager extends TodoManager {

    void all({CompletionCallback completion}) {
        completion(ResultSuccess(data: TodoTestData.shared.data));
    }
    void completed({String id, bool completed, CompletionCallback completion}) {
        final todo = _findTodo(id: id);
        if(todo != null) {
            todo.completed = completed;
            completion(ResultSuccess(data: todo));
        }
        else {
            completion(ResultSemanticError(reason: TodoErrorReason.notFound));
        }
    }

    void create({TodoValues values, CompletionCallback completion}) {
        final todo = values.toTodo( id: Uuid().v1());
        TodoTestData.shared.data.add(todo);
        completion(ResultSuccess(data: todo));

    }
    void update({String id, TodoValues values, CompletionCallback completion}) {
        final todo = _findTodo(id: id);
        if(todo != null) {
            values.setOn(todo: todo);
            completion(ResultSuccess(data: todo));
        }
        else {
            completion(ResultSemanticError(reason: TodoErrorReason.notFound));
        }
    }

    void fetch({String id, CompletionCallback completion}) {
        for (final entity in TodoTestData.shared.data) {
            if (entity.id == id) {
                completion(ResultSuccess(data: entity));
                return;
            }
        }
    }

    void delete({String id, CompletionCallback completion}) {

        final index = _findTodoIndex(id: id);
        if(index != null) {
            final todo = TodoTestData.shared.data[index];
            TodoTestData.shared.data.remove(index);
            completion(ResultSuccess(data: todo));
        }
        else {
            completion(ResultSemanticError(reason: TodoErrorReason.notFound));
        }
    }


    Todo _findTodo({String id}) {
        for(final entity in TodoTestData.shared.data) {
            if(entity.id == id) {
                return entity;
            }
        }
        return null;
    }

    int _findTodoIndex({String id}) {
        int index = 0;
        for (final entity in TodoTestData.shared.data) {
            if(entity.id == id) {
                return index;
            }
            index++;
        }
        return null;
    }
}

