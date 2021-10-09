//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Managers/Result.dart';
import 'package:flutter_todo/Scenes/AppState/TodoAppState.dart';
import 'package:flutter_todo/Scenes/Common/StarterBloc.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';

import 'TodoListPresentationRowModel.dart';
import 'TodoListUseCaseOutput.dart';

class TodoListUseCase with StarterBloc<TodoListUseCaseOutput> {

    final EntityGateway _entityGateway;
    final TodoAppState _appState;

    TodoListUseCase(this._entityGateway, this._appState);

    void eventViewReady() async {
        final result = await _entityGateway.todoManager.all();
        if(result is SuccessResult) {
            _appState.toDoList = result.data;
            _refreshPresentation();
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is DomainIssueResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }

    void _refreshPresentation() {
        streamAdd(
            PresentModel(_appState.toDoList.map((entity) => TodoListPresentationRowModel(entity)).toList()));
    }

    void eventCompleted(bool completed, int index) async {
        final result = await _entityGateway.todoManager.completed(_appState.toDoList[index].id, completed);
        if(result is SuccessResult) {
            _appState.toDoList[index].completed = completed;
            _refreshPresentation();
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is DomainIssueResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }

    void eventDelete(int index) async {
        final result = await _entityGateway.todoManager.delete(_appState.toDoList[index].id);
        if(result is SuccessResult) {
            _appState.toDoList.removeAt(index);
            _refreshPresentation();
        }
        else if(result is FailureResult)
            assert(false, "Unresolved error: ${result.description}");
        else if(result is DomainIssueResult)
            assert(false, "Unexpected Semantic error: reason ${result.reason}");
    }

    void eventItemSelected(int index) {
        _appState.itemStartMode = TodoItemStartModeUpdate(index, _refreshPresentation);
        streamAdd(PresentItemDetail());
    }

    void eventCreate() {
        _appState.itemStartMode = TodoItemStartModeCreate(_refreshPresentation);
        streamAdd(PresentItemDetail());
    }

    @override
    void dispose() {
        super.dispose();
    }

}
