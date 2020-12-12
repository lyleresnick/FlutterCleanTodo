//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';

import 'TodoListViewReadyUseCaseTransformer.dart';
import 'TodoListCompletedUseCaseTransformer.dart';
import 'TodoListDeleteUseCaseTransformer.dart';
import 'TodoListUseCaseOutput.dart';

class TodoListUseCase extends Bloc {

    final _controller = StreamController<TodoListUseCaseOutput>();
    Stream<TodoListUseCaseOutput> get stream => _controller.stream;

    final EntityGateway entityGateway;

    TodoListUseCase({@required this.entityGateway});

    void eventViewReady() {

        final transformer = TodoListViewReadyUseCaseTransformer(entityGateway.todoManager);
        transformer.transform(output: _controller.sink);
    }

    void eventCompleted(bool completed, int index, String id) {

        final transformer = TodoListCompletedUseCaseTransformer(entityGateway.todoManager);
        transformer.transform(completed, index, id, _controller.sink);
    }

    void eventDelete(int index, String id) {

        final transformer = TodoListDeleteUseCaseTransformer(entityGateway.todoManager);
        transformer.transform(index, id, _controller.sink);
    }

    @override
    void dispose() {
        _controller.close();
    }

}
