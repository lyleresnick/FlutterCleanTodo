//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../../Managers/TodoManager.dart';
import '../../../Managers/Result.dart';

import 'TodoListUseCaseIncludes.dart';

class TodoListViewReadyUseCaseTransformer extends TodoListUseCaseTransformer {

    TodoListViewReadyUseCaseTransformer(TodoManager todoManager) : super(todoManager);

    void transform({TodoListViewReadyUseCaseOutput output}) {

        todoManager.all(completion: (result) {

            switch(result.runtimeType) {
            case ResultSuccess:
                ResultSuccess entity = result;
                output.presentTodoListBegin();
                for(final entity in entity.data) {
                    output.present(TodoListPresentationModel(entity));
                }
                output.presentTodoListEnd();
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
