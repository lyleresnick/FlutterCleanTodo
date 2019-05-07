//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoItemEditViewModel.dart';

abstract class TodoItemEditPresenterOutput implements
    TodoItemEditViewReadyPresenterOutput,
    TodoItemEditCompleteByPresenterOutput,
    TodoItemEditSavePresenterOutput {}

abstract class TodoItemEditViewReadyPresenterOutput {

    void showModel(TodoItemEditViewModel model, String titlePlaceholder, List<String> priorityLabels);
}

abstract class TodoItemEditCompleteByPresenterOutput {

    void showCompleteBy(String completeBy);
    void showEnableEditCompleteBy(DateTime completeBy);
    void showCompleteByClear();
}

abstract class TodoItemEditSavePresenterOutput {
    void showTitleIsEmpty(String alertTitle, String message);
}
