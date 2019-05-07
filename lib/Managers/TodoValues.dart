import 'package:meta/meta.dart';
import '../Entities/Priority.dart';
import '../Entities/Todo.dart';

class TodoValues {

    String title;
    String note;
    DateTime completeBy;
    Priority priority;
    bool completed;

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

