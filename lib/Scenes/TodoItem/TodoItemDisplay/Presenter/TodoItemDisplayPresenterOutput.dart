//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'TodoItemDisplayRowViewModel.dart';
part "TodoItemDisplayPresenterOutput.freezed.dart";

@freezed
class TodoItemDisplayPresenterOutput with _$TodoItemDisplayPresenterOutput  {
  const factory TodoItemDisplayPresenterOutput.showFieldList(List<TodoItemDisplayRowViewModel> model) = _ShowFieldList;
}
