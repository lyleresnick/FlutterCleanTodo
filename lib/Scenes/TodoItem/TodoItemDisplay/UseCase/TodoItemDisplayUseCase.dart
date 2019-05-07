//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/UseCaseStore/UseCaseStore.dart';
import 'package:flutter_todo/UseCaseStore/RealUseCaseStore.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';

import '../../TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

import 'TodoItemDisplayViewReadyUseCaseTransformer.dart';
import 'TodoItemDisplayUseCaseOutput.dart';

class TodoItemDisplayUseCase {

    TodoItemDisplayUseCaseOutput output;
    final UseCaseStore _useCaseStore;
    TodoItemUseCaseState _itemState;


    TodoItemDisplayUseCase({UseCaseStore useCaseStore})
        : _useCaseStore  = useCaseStore ?? RealUseCaseStore.store {

        _itemState = _useCaseStore.getObject(itemStateKey);
    }

    void eventViewReady() {

        final transformer = TodoItemDisplayViewReadyUseCaseTransformer(_itemState);
        transformer.transform(output);
    }

}
