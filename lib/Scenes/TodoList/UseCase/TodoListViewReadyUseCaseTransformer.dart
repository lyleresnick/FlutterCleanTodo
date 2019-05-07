//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../../Managers/TodoManager.dart';
import '../../../Managers/Result.dart';

import 'TodoListUseCaseTransformer.dart';
import 'TodoListUseCaseOutput.dart';
import 'TodoListPresentationModel.dart';

class TodoListViewReadyUseCaseTransformer extends TodoListUseCaseTransformer {

    TodoListViewReadyUseCaseTransformer(TodoManager todoManager) : super(todoManager);

    void transform({TodoListViewReadyUseCaseOutput output}) async {

        final result = await todoManager.all();
        if(result is SuccessResult) {
            output.presentTodoListBegin();
            for(final entity in result.data) {
                output.present(TodoListPresentationModel(entity));
            }
            output.presentTodoListEnd();
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is SemanticErrorResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }
}
