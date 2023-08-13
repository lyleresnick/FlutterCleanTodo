//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

@visibleForTesting
class ViewModel {
  final String title;
  final String note;
  final DateTime? completeBy;
  final bool completeBySwitchIsOn;
  final String completeByString;
  final int priority;
  final bool completed;
  ErrorMessage? errorMessage;
  bool showEditCompleteBy;

  ViewModel.fromModel(PresentationModel model)
      : title = model.title,
        note = model.note,
        completeBy = model.completeBy,
        completeByString =
            (model.completeBy != null) ? localizedDate(model.completeBy!) : "",
        completeBySwitchIsOn = (model.completeBy != null),
        priority = bangsFromPriority(model.priority),
        completed = model.completed,
        errorMessage = model.errorMessage,
        showEditCompleteBy = model.showEditCompleteBy;
}
