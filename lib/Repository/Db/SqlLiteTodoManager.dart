//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import '../Entities/Entity.dart';
import '../Entities/Priority.dart';
import '../Entities/Todo.dart';
import '../Abstraction/Result.dart';
import '../Abstraction/TodoManager.dart';
import '../Abstraction/TodoValues.dart';
import 'SqlLiteManager.dart';

class SqlLiteTodoManager implements TodoManager {
  final SqlLiteManager db;

  SqlLiteTodoManager(this.db);

  @override
  Future<Result<List<Todo>>> all() async {
    final database = await db.database;
    final todos = await database.query('todo');

    final all =
        todos.map((todoResponse) => todoResponse._todo).toList();
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
    } catch (reason) {
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
        todo._dynamicValueMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return success(todo);
    } catch (reason) {
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
    } catch (reason) {
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
    final todoMap = await database.query(
      'todo',
      distinct: true,
      where: "id = ?",
      whereArgs: [id],
    );
    if (todoMap.length == 1)
      return todoMap[0]._todo;
    else
      throw "id $id notFound";
  }

  @override
  Future<Result<Todo>> update(String id, TodoValues values) async {
    Todo todo = (
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
        todo._dynamicValueMap,
        where: "id = ?",
        whereArgs: [id],
      );
      if (count != 1) return failure("id $id notFound");
      return success(todo);
    } catch (reason) {
      return failure(reason.toString());
    }
  }
}

extension on Map<String, dynamic> {
  static const _idProp = "id";
  static const _titleProp = "title";
  static const _noteProp = "note";
  static const _completeByProp = "completeBy";
  static const _priorityProp = "priority";
  static const _completedProp = "completed";

  Todo get _todo {
    jsonNullCheck(this, [_idProp, _titleProp, _noteProp, _completedProp],
        "Todo.fromStringValueDictionary");
    final id = this[_idProp] as String;
    final title = this[_titleProp] as String;
    final note = this[_noteProp] as String;
    final completeBy = this[_completeByProp] as int?;
    final priority = this[_priorityProp] ?? "none";
    final completed = this[_completedProp] as int;

    return (
        id: id,
        title: title,
        note: note,
        completeBy: (completeBy != null)
            ? DateTime.fromMillisecondsSinceEpoch(completeBy)
            : null,
        priority: PriorityExt.fromString(priority),
        completed: (completed == 1));
  }
}

extension on TodoValues {
  Todo _toTodo({required String id}) {
    return (
        id: id,
        title: this.title,
        note: this.note,
        completeBy: this.completeBy,
        priority: this.priority,
        completed: this.completed);
  }
}

extension on Todo {
  Map<String, dynamic> get _dynamicValueMap {
    return {
      'id': id,
      'title': title,
      'note': note,
      'completeBy': completeBy?.millisecondsSinceEpoch,
      'priority': (priority == Priority.none) ? null : priority.name,
      'completed': completed ? 1 : 0,
    };
  }
}
