


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
  Future<Result> all() async {

    final database = await db.database;
    final todos = await database.query('todo');

    final all = todos.map((todo) => Todo.fromDynamicValueDictionary(todo)).toList();
    return Future.value(SuccessResult(data: all));
  }

  @override
  Future<Result> completed({String id, bool completed}) async {

      final result = await fetch(id: id);
      try {
          if(!(result is SuccessResult)) throw TodoErrorReason.notFound;
          final todo = (result as SuccessResult).data as Todo;
          todo.completed = completed;

          final database = await db.database;
          final count = await database.update(
              'todo',
              todo.toDynamicValueMap(),
              where: "id = ?",
              whereArgs: [id],
          );
          if(count != 1 ) throw TodoErrorReason.notFound;
          return Future.value(SuccessResult(data: todo));
      }
      catch (e) {
          return Future.value(SemanticErrorResult(reason: e));
      }
  }

  @override
  Future<Result> create({TodoValues values}) async {

      final database = await db.database;
      final todo = values.toTodo( id: Uuid().v1());
      await database.insert(
          'todo',
          todo.toDynamicValueMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return Future.value(SuccessResult(data: todo));
  }

  @override
  Future<Result> delete({String id}) async {

      final result = await fetch(id: id);
      try {
          if(!(result is SuccessResult)) throw TodoErrorReason.notFound;
          final todo = (result as SuccessResult).data as Todo;

          final database = await db.database;
          final count = await database.delete(
              'todo',
              where: "id = ?",
              whereArgs: [id],
          );
          if(count != 1 ) throw TodoErrorReason.notFound;
          return Future.value(SuccessResult(data: todo));
      }
      catch (e) {
          return Future.value(SemanticErrorResult(reason: e));
      }
  }

  @override
  Future<Result> fetch({String id}) async {

      final database = await db.database;
      final todo = await database.query(
          'todo',
          distinct: true,
          where: "id = ?",
          whereArgs: [id],
      );
      if(todo.length == 1 )
          return Future.value(SuccessResult(data: Todo.fromDynamicValueDictionary(todo[0])));
      else
          return Future.value(SemanticErrorResult(reason: TodoErrorReason.notFound));
  }

  @override
  Future<Result> update({String id, TodoValues values}) async {
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
      if(count == 1 )
          return Future.value(SuccessResult(data: todo));
      else
          return Future.value(SemanticErrorResult(reason: TodoErrorReason.notFound));
  }
}