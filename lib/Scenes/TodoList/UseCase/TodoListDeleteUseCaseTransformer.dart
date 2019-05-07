//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../../../Managers/TodoManager.dart';
import '../../../Managers/Result.dart';
import 'TodoListUseCaseTransformer.dart';
import 'TodoListUseCaseOutput.dart';

class TodoListDeleteUseCaseTransformer extends TodoListUseCaseTransformer
{
    TodoListDeleteUseCaseTransformer(TodoManager todoManager) : super(todoManager);

    void transform(int index, String id, TodoListDeleteUseCaseOutput output) async {

        final result = await todoManager.delete(id: id);
        if(result is SuccessResult)
            output.presentDeleted(index);
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is SemanticErrorResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }
}
