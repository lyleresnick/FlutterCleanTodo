//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/UseCaseStore/UseCaseStore.dart';
import 'package:flutter_todo/UseCaseStore/RealUseCaseStore.dart';
import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListPresentationModel.dart';

import '../../TodoItemStartMode.dart';
import '../../TodoItemEditMode.dart';

import 'TodoItemRouterUseCaseOutput.dart';
import 'TodoItemUseCaseState.dart';
import 'TodoItemRouterViewReadyUseCaseTransformer.dart';

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


    void eventViewReady({TodoItemStartMode startMode}) {

        final transformer = TodoItemRouterViewReadyUseCaseTransformer(_entityGateway.todoManager, _itemState);
        transformer.transform(startMode: startMode, output: output);
    }

    void eventBack() {

        if(_itemState.itemChanged) {
            output.presentChanged(TodoListPresentationModel(_itemState.currentTodo));
        }
    }

    destroy() {
        _useCaseStore.setObject(itemStateKey, null);
    }


}
