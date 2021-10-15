//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'TodoItemEditPresentationModel.dart';
part "TodoItemEditUseCaseOutput.freezed.dart";

@freezed
class TodoItemEditUseCaseOutput with _$TodoItemEditUseCaseOutput  {
  const factory TodoItemEditUseCaseOutput.presentModel(TodoItemEditPresentationModel model) = _PresentModel;
  const factory TodoItemEditUseCaseOutput.presentSaveCompleted() = _PresentSaveCompleted;
  const factory TodoItemEditUseCaseOutput.presentEditingCancelled() = _PresentEditingCancelled;
  const factory TodoItemEditUseCaseOutput.presentCreateCancelled() = _PresentCreateCancelled;
}


