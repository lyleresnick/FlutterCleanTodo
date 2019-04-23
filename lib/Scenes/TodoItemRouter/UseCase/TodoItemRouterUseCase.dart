//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

import '../TodoItemStartMode.dart';
import '../TodoItemEditMode.dart';
import '../../../EntityGateway/EntityGateway.dart';
import 'TodoItemRouterUseCaseOutput.dart';
import 'TodoItemUseCaseState.dart';
import '../../../UseCaseStore/UseCaseStore.dart';
import '../../../UseCaseStore/RealUseCaseStore.dart';
import 'TodoItemRouterViewReadyUseCaseTransformer.dart';
import '../../../Scenes/TodoList/UseCase/TodoListPresentationModel.dart';

class TodoItemRouterUseCase {

    TodoItemRouterUseCaseOutput output;
    final EntityGateway _entityGateway;
    UseCaseStore _useCaseStore;
    final _itemState = TodoItemUseCaseState();

    TodoItemRouterUseCase({EntityGateway entityGateway, UseCaseStore useCaseStore})
            : _entityGateway = entityGateway ?? EntityGateway.entityGateway,
              _useCaseStore  = useCaseStore ?? RealUseCaseStore.store {

        _useCaseStore.setObject(itemStateKey, _itemState);
    }


    void eventViewReady({TodoStartMode startMode}) {

        final transformer = TodoItemRouterViewReadyUseCaseTransformer(_entityGateway.todoManager, _itemState);
        transformer.transform(startMode: startMode, output: output);
    }

    void eventBack() {

        if(_itemState.itemChanged) {
            output.presentChanged(TodoListPresentationModel(_itemState.currentTodo));
        }
    }

//    deinit {
//        _useCaseStore.setObject(itemStateKey, null);
//    }


}
