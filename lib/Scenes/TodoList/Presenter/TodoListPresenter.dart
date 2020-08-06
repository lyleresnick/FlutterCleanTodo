//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/Common/Localize.dart';

import '../UseCase/TodoListUseCase.dart';
import '../Router/TodoListRouter.dart';
import '../UseCase/TodoListPresentationModel.dart';
import '../UseCase/TodoListUseCaseOutput.dart';
import 'TodoListRowViewModel.dart';
import 'TodoListPresenterOutput.dart';

class TodoListPresenter implements TodoListUseCaseOutput {

    final TodoListUseCase _useCase;
    TodoListRouter _router;
    TodoListPresenterOutput output;

    List<TodoListRowViewModel> _viewModelList = [];

    TodoListPresenter({TodoListUseCase useCase, TodoListRouter router}) :_useCase = useCase, _router = router;

    void eventViewReady() {
        _useCase.eventViewReady();
    }

    void eventCompleted(int index) {
        _useCase.eventCompleted(true, index, _viewModelList[index].id);
    }

    void eventNotCompleted(int index) {
        _useCase.eventCompleted(false, index, _viewModelList[index].id);
    }

    void eventDelete(int index) {
        _useCase.eventDelete(index, _viewModelList[index].id);
    }

    void eventCreate() {

        _router.routeCreateItem((model) {

            final index = _viewModelList.length;
            _viewModelList.add(TodoListRowViewModel(model));
            output.showAdded(_viewModelList, index);
        });
    }

    void eventItemSelected(int index) {

        _router.routeDisplayItem(_viewModelList[index].id, (model) {

            _viewModelList[index] = TodoListRowViewModel(model);
            output.showChanged(_viewModelList, index);
        });
    }

// TodoListViewReadyUseCaseOutput

    void presentTodoListBegin() {
        _viewModelList = [];
    }

    void present(TodoListPresentationModel model) {
        _viewModelList.add(TodoListRowViewModel(model));
    }

    void presentTodoListEnd() {
        output.showTodoList(_viewModelList);
    }

    String get titleLabel => localizeString("todoList");


// TodoListCompleteUseCaseOutput

    void presentCompleted(TodoListPresentationModel model, int index) {
        _viewModelList[index] = TodoListRowViewModel(model);
       output.showCompleted(_viewModelList, index);
    }

// TodoListDeleteUseCaseOutput

    void presentDeleted(int index) {
        _viewModelList.removeAt(index);
        output.showDeleted(_viewModelList, index);
    }

  @override
  void presentUndoDeleted(int index) {
      output.showUndoDeleted(_viewModelList, index);
  }
}
