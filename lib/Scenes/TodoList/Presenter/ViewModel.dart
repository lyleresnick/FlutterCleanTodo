//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
class ViewModel {
    final List<RowViewModel> rows;

    ViewModel.fromPresentation(PresentationModel model)
    : rows = model.rows
        .map((row) => RowViewModel.fromPresentation(row))
        .toList();
}



@visibleForTesting
class RowViewModel {

    final String id;
    final String title;
    final String completeBy;
    final String priority;
    final bool completed;

    RowViewModel.fromPresentation(PresentationRowModel model) :
        id = model.id,
        title = model.title,
        completeBy = (model.completeBy != null) ? localizedDate(model.completeBy!) : "",
        priority = List<String>.generate(model.priority.bangs + 1, (index) => " " ).reduce((value, element) => "!$value" ),
        completed = model.completed ;
}
