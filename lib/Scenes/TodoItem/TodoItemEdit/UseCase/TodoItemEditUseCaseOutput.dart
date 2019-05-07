//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoItemEditPresentationModel.dart';

abstract class TodoItemEditUseCaseOutput implements
    TodoItemEditViewReadyUseCaseOutput,
    TodoItemEditSaveUseCaseOutput,
    TodoItemEditCompleteByUseCaseOutput {}

abstract class TodoItemEditViewReadyUseCaseOutput {

    void presentModel(TodoItemEditPresentationModel model);
    void presentNewModel();
}

abstract class TodoItemEditSaveUseCaseOutput {

    void presentSaveCompleted();
    void presentTitleIsEmpty();
}

abstract class TodoItemEditCompleteByUseCaseOutput {

    void presentEnableEditCompleteBy(DateTime completeBy);
    void presentCompleteByClear();
    void presentCompleteBy(DateTime completeBy);
}

