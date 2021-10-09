//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/Common/ErrorMessages.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditPresentationModel.dart';

class TodoItemEditViewModel {
  final String title;
  final String note;
  final DateTime? completeBy;
  final bool completeBySwitchIsOn;
  final String completeByString;
  final int priority;
  final bool completed;
  ErrorMessage? errorMessage;
  bool showEditCompleteBy;

  TodoItemEditViewModel.fromModel(TodoItemEditPresentationModel model)
      : title = model.title,
        note = model.note,
        completeBy = model.completeBy,
        completeByString =
            (model.completeBy != null) ? localizeDate(model.completeBy!) : "",
        completeBySwitchIsOn = (model.completeBy != null),
        priority = model.priority,
        completed = model.completed,
        errorMessage = model.errorMessage,
        showEditCompleteBy = model.showEditCompleteBy;
}
