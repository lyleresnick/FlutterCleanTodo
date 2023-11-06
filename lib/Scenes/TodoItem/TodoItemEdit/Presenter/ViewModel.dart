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
  final String modeTitle;
  final ErrorMessage? errorMessage;
  final bool showEditCompleteBy;
  final bool isWaiting;

  ViewModel.fromModel(PresentationModel model)
      : title = model.title,
        note = model.note,
        completeBy = model.completeBy,
        completeByString =
            (model.completeBy != null) ? localizedDate(model.completeBy!) : "",
        completeBySwitchIsOn = (model.completeBy != null),
        priority = model.priority.bangs,
        completed = model.completed,
        modeTitle = model.modeTitle,
        errorMessage = model.errorMessage,
        showEditCompleteBy = model.showEditCompleteBy,
        isWaiting = model.isWaiting;
}
