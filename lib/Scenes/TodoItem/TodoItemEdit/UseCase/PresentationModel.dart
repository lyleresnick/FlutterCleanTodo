//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

@visibleForTesting
typedef PresentationModel = ({
  String title,
  String note,
  DateTime? completeBy,
  Priority priority,
  bool completed,
  String modeTitle,
  bool showEditCompleteBy,
  ErrorMessage? errorMessage,
  bool isWaiting
});

extension on EditingTodo {
  PresentationModel presentationModel(
      {required String modeTitle,
      ErrorMessage? errorMessage,
      bool showEditCompleteBy = false,
      isWaiting = false}) {
    return (
      title: this.title,
      note: this.note,
      completeBy: this.completeBy,
      priority: this.priority,
      completed: this.completed,
      modeTitle: modeTitle,
      errorMessage: errorMessage,
      isWaiting: isWaiting,
      showEditCompleteBy: showEditCompleteBy
    );
  }
}
