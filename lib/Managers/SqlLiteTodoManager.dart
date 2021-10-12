import 'package:flutter_todo/Entities/Todo.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/Managers/TodoValues.dart';
import 'package:flutter_todo/SqlLite/SqlLiteManager.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class SqlLiteTodoManager implements TodoManager {
  final SqlLiteManager db;

  SqlLiteTodoManager(this.db);

  @override
  Future<Result<List<Todo>, TodoDomainReason>> all() async {
    final database = await db.database;
    final todos = await database.query('todo');

    final all =
        todos.map((todo) => Todo.fromDynamicValueDictionary(todo)).toList();
    return Result.success(all);
  }

  @override
  Future<Result<Todo, TodoDomainReason>> completed(String id, bool completed) async {
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
      if (count != 1) throw TodoDomainReason.updateFailure;
      final todo = await _fetchBody(id);
      return Result.success(todo);
    } on TodoDomainReason catch (reason) {
      return Result.domainIssue(reason);
    }
  }

  @override
  Future<Result<Todo, TodoDomainReason>> create(TodoValues values) async {
    final database = await db.database;
    final todo = values.toTodo(id: Uuid().v1());
    await database.insert(
      'todo',
      todo.toDynamicValueMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return Result.success(todo);
  }

  @override
  Future<Result<Todo, TodoDomainReason>> delete(String id) async {
    try {
      final todo = await _fetchBody(id);
      final database = await db.database;
      final count = await database.delete(
        'todo',
        where: "id = ?",
        whereArgs: [id],
      );
      if (count != 1) throw TodoDomainReason.deleteFailure;
      return Result.success(todo);
    } on TodoDomainReason catch (reason) {
      return Result.domainIssue(reason);
    }
  }

  @override
  Future<Result<Todo, TodoDomainReason>> fetch(String id) async {
    try {
      final todo = await _fetchBody(id);
      return Result.success(todo);
    } on TodoDomainReason catch (reason) {
      return Result.domainIssue(reason);
    } catch (e) {
      return Result.failure(0, e.toString());
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
      throw TodoDomainReason.notFound;
  }

  @override
  Future<Result<Todo, TodoDomainReason>> update(String id, TodoValues values) async {
    var todo = Todo(
      id: id,
      title: values.title,
      note: values.note,
      completeBy: values.completeBy,
      priority: values.priority,
      completed: values.completed,
    );

    final database = await db.database;
    final count = await database.update(
      'todo',
      todo.toDynamicValueMap(),
      where: "id = ?",
      whereArgs: [id],
    );
    if (count == 1)
      return Result.success(todo);
    else
      return Result.domainIssue(TodoDomainReason.notFound);
  }
}
