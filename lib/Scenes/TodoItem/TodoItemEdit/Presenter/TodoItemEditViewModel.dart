//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/UseCase/TodoItemEditPresentationModel.dart';
import 'package:meta/meta.dart';

class TodoItemEditViewModel {

    @required final String title;
    final String note;
    final DateTime completeBy;
    final bool completeBySwitchIsOn;
    @required final String completeByString;
    @required final int priority;
    @required final bool completed;

    TodoItemEditViewModel.fromModel(TodoItemEditPresentationModel model)
      : title = model.title,
        note = model.note,
        completeBy = model.completeBy,
        completeByString = (model.completeBy != null) ? localizeDate(model.completeBy) : "",
        completeBySwitchIsOn = (model.completeBy != null),

        priority = model.priority,
        completed = model.completed;


    TodoItemEditViewModel()
      : title = "",
        note = "",
        completeBy = null,
        completeByString = "",
        completeBySwitchIsOn = false,
        priority = 0,
        completed = false;
}
