//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

@visibleForTesting
typedef ViewModel = ({
  String title,
  String note,
  DateTime? completeBy,
  bool completeBySwitchIsOn,
  String completeByString,
  int priority,
  bool completed,
  String modeTitle,
  ErrorMessage? errorMessage,
  bool showEditCompleteBy,
  bool isWaiting,
});

extension on PresentationModel {
  ViewModel get viewModel {
    return (
      title: this.title,
      note: this.note,
      completeBy: this.completeBy,
      completeByString: (this.completeBy != null) ? localizedDate(this.completeBy!) : "",
      completeBySwitchIsOn: (this.completeBy != null),
      priority: this.priority.bangs,
      completed: this.completed,
      modeTitle: this.modeTitle,
      errorMessage: this.errorMessage,
      isWaiting: this.isWaiting,
      showEditCompleteBy: this.showEditCompleteBy,
    );
  }
}
