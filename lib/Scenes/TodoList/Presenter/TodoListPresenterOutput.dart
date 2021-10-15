//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoListRowViewModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "TodoListPresenterOutput.freezed.dart";

@freezed
class TodoListPresenterOutput with _$TodoListPresenterOutput {
  const factory TodoListPresenterOutput.showModel(List<TodoListRowViewModel> model) = _ShowModel;
}
