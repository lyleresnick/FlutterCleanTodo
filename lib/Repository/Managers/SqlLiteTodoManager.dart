import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import '../Entities/Todo.dart';
import '../Managers/Result.dart';
import '../Managers/TodoManager.dart';
import '../Managers/TodoValues.dart';
import '../SqlLite/SqlLiteManager.dart';

class SqlLiteTodoManager implements TodoManager {
  final SqlLiteManager db;

  SqlLiteTodoManager(this.db);

  @override
  Future<Result<List<Todo>>> all() async {
    final database = await db.database;
    final todos = await database.query('todo');

    final all =
        todos.map((todo) => Todo.fromDynamicValueDictionary(todo)).toList();
    return success(all);
  }

  @override
  Future<Result<Todo>> completed(String id, bool completed) async {
    try {
      final database = await db.database;
      final count = await database.update(
        'todo',
        {
          'completed': completed ? 1 : 0,
        },
        where: "id = ?",
        whereArgs: [id],
      );
      if (count != 1) return failure("id $id notFound");
      final todo = await _fetchBody(id);
      return success(todo);
    }
    catch (reason) {
      return failure(reason.toString());
    }
  }

  @override
  Future<Result<Todo>> create(TodoValues values) async {
    try {
      final database = await db.database;
      final todo = values._toTodo(id: Uuid().v1());
      await database.insert(
        'todo',
        todo.toDynamicValueMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return success(todo);
    }
    catch (reason) {
      return failure(reason.toString());
    }
  }

  @override
  Future<Result<Todo>> delete(String id) async {
    try {
      final todo = await _fetchBody(id);
      final database = await db.database;
      final count = await database.delete(
        'todo',
        where: "id = ?",
        whereArgs: [id],
      );
      if (count != 1) return failure("id $id notFound");
      return success(todo);
    }
    catch (reason) {
      return failure(reason.toString());
    }
  }

  @override
  Future<Result<Todo>> fetch(String id) async {
    try {
      final todo = await _fetchBody(id);
      return success(todo);
    } catch (reason) {
      return failure(reason.toString());
    }
  }

  Future<Todo> _fetchBody(String id) async {
    final database = await db.database;
    final todo = await database.query(
      'todo',
      distinct: true,
      where: "id = ?",
      whereArgs: [id],
    );
    if (todo.length == 1)
      return Todo.fromDynamicValueDictionary(todo[0]);
    else
      throw "id $id notFound";
  }

  @override
  Future<Result<Todo>> update(String id, TodoValues values) async {
    var todo = Todo(
      id: id,
      title: values.title,
      note: values.note,
      completeBy: values.completeBy,
      priority: values.priority,
      completed: values.completed,
    );

    try {
      final database = await db.database;
      final count = await database.update(
        'todo',
        todo.toDynamicValueMap(),
        where: "id = ?",
        whereArgs: [id],
      );
      if (count != 1) return failure("id $id notFound");
      return success(todo);
    }
    catch (reason) {
      return failure(reason.toString());
    }
  }
}

extension on TodoValues {
  Todo _toTodo({required String id}) {
    return Todo(
        id: id,
        title: this.title,
        note: this.note,
        completeBy: this.completeBy,
        priority: this.priority,
        completed: this.completed
    );
  }


}
