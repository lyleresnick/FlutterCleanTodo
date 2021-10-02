import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditUseCase.dart';
import 'package:meta/meta.dart';
import '../Entities/Priority.dart';
import '../Entities/Todo.dart';

class TodoValues {

    final String title;
    final String note;
    final DateTime completeBy;
    final Priority priority;
    final bool completed;

    TodoValues({@required this.title, @required this.note, @required this.completeBy, @required this.priority, @required this.completed});


    factory TodoValues.fromEditing(EditingTodo editingTodo) {
        return TodoValues(
            title: editingTodo.title,
            note: editingTodo.note,
            completeBy: editingTodo.completeBy,
            priority: editingTodo.priority,
            completed: editingTodo.completed,
        );
    }

    Todo toTodo({@required String id}) {
        return Todo(
            id: id,
            title: this.title,
            note: this.note,
            completeBy: this.completeBy,
            priority: this.priority,
            completed: this.completed
        );
    }

    void setOn({@required Todo todo}) {

        todo.title = this.title;
        todo.note = this.note;
        todo.completeBy = this.completeBy;
        todo.priority = this.priority;
        todo.completed = this.completed;
    }

}

