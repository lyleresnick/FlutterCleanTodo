//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../Entities/Todo.dart';

import 'Result.dart';
import 'TodoValues.dart';

abstract class TodoManager {

    Future<Result<List<Todo>>> all();
    Future<Result<Todo>> completed(String id, bool completed);
    Future<Result<Todo>> create(TodoValues values);
    Future<Result<Todo>> update(String id, TodoValues values);
    Future<Result<Todo>> fetch(String id);
    Future<Result<Todo>> delete(String id);
}



