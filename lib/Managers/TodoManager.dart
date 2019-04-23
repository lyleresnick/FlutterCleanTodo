
import 'Result.dart';
import 'TodoValues.dart';
import '../Entities/Todo.dart';

enum TodoErrorReason {
    notFound
}

enum DataSources {
    test,
    coreData
}

typedef CompletionCallback = void Function(Result);

abstract class TodoManager {

    void all({CompletionCallback completion});
    void completed({String id, bool completed, CompletionCallback completion});

    void create({TodoValues values, CompletionCallback completion});
    void update({String id, TodoValues values, CompletionCallback completion});
    void fetch({String id, CompletionCallback completion});
    void delete({String id, CompletionCallback completion});
}



