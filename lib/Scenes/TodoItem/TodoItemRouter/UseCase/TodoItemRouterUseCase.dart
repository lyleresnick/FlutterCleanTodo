//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';
import 'package:flutter_todo/Scenes/TodoList/UseCase/TodoListPresentationModel.dart';

import 'TodoItemRouterUseCaseOutput.dart';
import 'TodoItemUseCaseState.dart';
import 'TodoItemRouterViewReadyUseCaseTransformer.dart';

class TodoItemRouterUseCase extends Bloc{

    final _controller = StreamController<TodoItemRouterUseCaseOutput>();
    Stream<TodoItemRouterUseCaseOutput> get stream => _controller.stream;

    final EntityGateway entityGateway;
    final TodoItemUseCaseState useCaseState;

    TodoItemRouterUseCase({@required this.entityGateway, @required this.useCaseState});

    void eventViewReady({TodoItemStartMode startMode}) {

        final transformer = TodoItemRouterViewReadyUseCaseTransformer(entityGateway.todoManager, useCaseState);
        transformer.transform(startMode: startMode, output: _controller.sink);
    }

    void eventBack() {

        if(useCaseState.itemChanged) {
            _controller.sink.add(PresentChanged(TodoListPresentationModel(useCaseState.currentTodo)));
        }
    }

    @override
    void dispose() {
        _controller.close();
    }
}
