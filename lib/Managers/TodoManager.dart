
import 'package:flutter_todo/Entities/Todo.dart';

import 'Result.dart';
import 'TodoValues.dart';

enum TodoDomainReason {
    notFound,
    deleteFailure,
    updateFailure
}

enum DataSources {
    test,
    coreData
}

abstract class TodoManager {

    Future<Result<List<Todo>, TodoDomainReason>> all();
    Future<Result<Todo, TodoDomainReason>> completed(String id, bool completed);
    Future<Result<Todo, TodoDomainReason>> create(TodoValues values);
    Future<Result<Todo, TodoDomainReason>> update(String id, TodoValues values);
    Future<Result<Todo, TodoDomainReason>> fetch(String id);
    Future<Result<Todo, TodoDomainReason>> delete(String id);
}



