//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'TodoItemEditViewModel.dart';
part "TodoItemEditPresenterOutput.freezed.dart";

@freezed
class TodoItemEditPresenterOutput with _$TodoItemEditPresenterOutput  {
  const factory TodoItemEditPresenterOutput.showModel(TodoItemEditViewModel model) = _ShowModel;
}

typedef Output = TodoItemEditPresenterOutput;
