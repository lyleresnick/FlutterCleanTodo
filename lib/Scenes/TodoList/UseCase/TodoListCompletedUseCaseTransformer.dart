//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoManager.dart';

import 'TodoListPresentationModel.dart';
import 'TodoListUseCaseOutput.dart';

class TodoListCompletedUseCaseTransformer {
    final TodoManager todoManager;

    TodoListCompletedUseCaseTransformer(this.todoManager);

    void transform(bool completed, int index, String id, StreamSink<TodoListUseCaseOutput> output) async {

        final result = await todoManager.completed(id: id, completed: completed);
        if(result is SuccessResult)
            output.add(PresentCompleted(TodoListPresentationModel(result.data), index));
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is SemanticErrorResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }
}
