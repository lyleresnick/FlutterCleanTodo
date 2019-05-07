//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoListViewReadyUseCaseTransformer.dart';
import 'TodoListCompletedUseCaseTransformer.dart';
import 'TodoListDeleteUseCaseTransformer.dart';
import 'TodoListUseCaseOutput.dart';
import '../../../EntityGateway/EntityGateway.dart';

class TodoListUseCase {

    TodoListUseCaseOutput output;
    final EntityGateway _entityGateway;

    TodoListUseCase({EntityGateway entityGateway})
            : _entityGateway = entityGateway ?? EntityGateway.entityGateway;

    void eventViewReady() {

        final transformer = TodoListViewReadyUseCaseTransformer(_entityGateway.todoManager);
        transformer.transform(output: output);
    }

    void eventCompleted(bool completed, int index, String id) {

        final transformer = TodoListCompletedUseCaseTransformer(_entityGateway.todoManager);
        transformer.transform(completed, index, id, output);
    }

    void eventDelete(int index, String id) {

        final transformer = TodoListDeleteUseCaseTransformer(_entityGateway.todoManager);
        transformer.transform(index, id, output);
    }
}
