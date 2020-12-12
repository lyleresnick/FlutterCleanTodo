//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';


import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Managers/TodoManager.dart';

import 'TodoListUseCaseOutput.dart';
import 'TodoListPresentationModel.dart';

class TodoListViewReadyUseCaseTransformer {

    final TodoManager todoManager;

    TodoListViewReadyUseCaseTransformer(this.todoManager);

    void transform({StreamSink<TodoListUseCaseOutput> output}) async {

        final result = await todoManager.all();
        if(result is SuccessResult) {
            output.add(PresentBegin());
            for(final entity in result.data) {
                output.add(PresentItem(TodoListPresentationModel(entity)));
            }
            output.add(PresentEnd());
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is SemanticErrorResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }
}
