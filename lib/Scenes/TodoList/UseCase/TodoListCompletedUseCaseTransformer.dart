//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../../Managers/Result.dart';
import '../../../Managers/TodoManager.dart';
import 'TodoListUseCaseTransformer.dart';
import 'TodoListPresentationModel.dart';
import 'TodoListUseCaseOutput.dart';

class TodoListCompletedUseCaseTransformer extends TodoListUseCaseTransformer {
    TodoListCompletedUseCaseTransformer(TodoManager todoManager) : super(todoManager);

    void transform(bool completed, int index, String id, TodoListCompletedUseCaseOutput output) async {

        final result = await todoManager.completed(id: id, completed: completed);
        if(result is SuccessResult)
            output.presentCompleted(TodoListPresentationModel(result.data), index);
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is SemanticErrorResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }
}
