//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoManager.dart';

import 'TodoListUseCaseOutput.dart';

class TodoListDeleteUseCaseTransformer
{
    final TodoManager todoManager;
    TodoListDeleteUseCaseTransformer(this.todoManager);

    void transform(int index, String id, StreamSink<TodoListUseCaseOutput> output) async {

        final result = await todoManager.delete(id: id);
        if(result is SuccessResult)
            output.add(PresentDeleted(index));
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is SemanticErrorResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }
}
