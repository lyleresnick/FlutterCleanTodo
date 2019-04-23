//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../../Managers/Result.dart';
import '../../../Managers/TodoManager.dart';

import 'TodoListUseCaseIncludes.dart';

class TodoListCompletedUseCaseTransformer extends TodoListUseCaseTransformer {
    TodoListCompletedUseCaseTransformer(TodoManager todoManager) : super(todoManager);

    void transform(bool completed, int index, String id, TodoListCompletedUseCaseOutput output) {
        todoManager.completed(id: id, completed: completed, completion: (result) {

            switch(result.runtimeType) {
                case ResultSuccess:
                    ResultSuccess entity = result;
                    output.presentCompleted(TodoListPresentationModel(entity.data), index);
                    break;
                case ResultFailure:
                    ResultFailure failure = result;
                    assert(false, "Unresolved error: ${failure.description}");
                    break;
                case ResultSemanticError:
                    ResultSemanticError semanticError = result;
                    assert(false, "semanticError ${semanticError.reason} has not been processed!");
                    break;
            }
        });
    }
}
