
import 'Result.dart';
import 'TodoValues.dart';

enum TodoDomainReason {
    notFound
}

enum DataSources {
    test,
    coreData
}

abstract class TodoManager {

    Future<Result> all();
    Future<Result> completed(String id, bool completed);
    Future<Result> create(TodoValues values);
    Future<Result> update(String id, TodoValues values);
    Future<Result> fetch(String id);
    Future<Result> delete(String id);
}



