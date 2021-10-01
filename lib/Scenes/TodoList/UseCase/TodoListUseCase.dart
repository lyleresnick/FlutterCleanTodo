//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Scenes/Common/Bloc.dart';

import 'TodoListPresentationModel.dart';
import 'TodoListUseCaseOutput.dart';

class TodoListUseCase extends Bloc {

    final _controller = StreamController<TodoListUseCaseOutput>();
    Stream<TodoListUseCaseOutput> get stream => _controller.stream;

    final EntityGateway _entityGateway;

    TodoListUseCase(this._entityGateway);

    void eventViewReady() async {
        final result = await _entityGateway.todoManager.all();
        if(result is SuccessResult) {
            _controller.sink.add(PresentBegin());
            for(final entity in result.data) {
                _controller.sink.add(PresentItem(TodoListPresentationModel(entity)));
            }
            _controller.sink.add(PresentEnd());
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is DomainMatterResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }

    void eventCompleted(bool completed, int index, String id) async {
        final result = await _entityGateway.todoManager.completed(id: id, completed: completed);
        if(result is SuccessResult)
            _controller.sink.add(PresentCompleted(TodoListPresentationModel(result.data), index));
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is DomainMatterResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }

    void eventDelete(int index, String id) async {
        final result = await _entityGateway.todoManager.delete(id: id);
        if(result is SuccessResult)
            _controller.sink.add(PresentDeleted(index));
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is DomainMatterResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }

    @override
    void dispose() {
        _controller.close();
    }

}
