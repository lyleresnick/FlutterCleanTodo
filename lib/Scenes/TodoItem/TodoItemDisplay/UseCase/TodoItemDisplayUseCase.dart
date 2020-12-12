//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemRouter/UseCase/TodoItemUseCaseState.dart';

import 'TodoItemDisplayViewReadyUseCaseTransformer.dart';
import 'TodoItemDisplayUseCaseOutput.dart';

class TodoItemDisplayUseCase extends Bloc {

    final _controller = StreamController<TodoItemDisplayUseCaseOutput>();
    Stream<TodoItemDisplayUseCaseOutput> get stream => _controller.stream;
    TodoItemUseCaseState useCaseState;

    TodoItemDisplayUseCase({@required this.useCaseState});

    void eventViewReady() {
        final transformer = TodoItemDisplayViewReadyUseCaseTransformer(useCaseState);
        transformer.transform(_controller.sink);
    }

    @override
    void dispose() {
        _controller.close();
    }

}
