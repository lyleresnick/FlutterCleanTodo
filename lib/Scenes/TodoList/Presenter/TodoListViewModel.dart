//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Entities/Priority.dart';

import '../UseCase/TodoListPresentationModel.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';


class TodoListViewModel {
    final List<TodoListRowViewModel> rows;

    TodoListViewModel.fromPresentation(TodoListPresentationModel model)
    : rows = model.rows
        .map((row) => TodoListRowViewModel.fromPresentation(row))
        .toList();
}



class TodoListRowViewModel {

    final String id;
    final String title;
    final String completeBy;
    final String priority;
    final bool completed;

    TodoListRowViewModel.fromPresentation(TodoListPresentationRowModel model) :
        id = model.id,
        title = model.title,
        completeBy = (model.completeBy != null) ? localizedDate(model.completeBy!) : "",
        priority = List<String>.generate(bangsFromPriority(model.priority) + 1, (index) => " " ).reduce((value, element) => "!$value" ),
        completed = model.completed ;
}
