//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../../Managers/TodoManager.dart';
import '../../../Managers/Result.dart';
import 'TodoListUseCaseIncludes.dart';

class TodoListDeleteUseCaseTransformer extends TodoListUseCaseTransformer
    {
    TodoListDeleteUseCaseTransformer(TodoManager todoManager) : super(todoManager);

    void transform(int index, String id, TodoListDeleteUseCaseOutput output) {

        todoManager.delete(id: id, completion: (result) {

            switch(result.runtimeType) {
                case ResultSuccess:
                    output.presentDeleted(index);
                    break;
                case ResultFailure:
                    output.presentUndoDeleted(index);
                    break;
                case ResultSemanticError:
                    ResultSemanticError semanticError = result;
                    assert(false, "semanticError ${semanticError.reason} has not been processed!");
                    break;
            }
        });
    }
}
