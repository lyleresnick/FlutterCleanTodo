//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoListPresentationRowModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "TodoListUseCaseOutput.freezed.dart";

@freezed
class TodoListUseCaseOutput with _$TodoListUseCaseOutput {
  const factory TodoListUseCaseOutput.presentModel(List<TodoListPresentationRowModel> model) = _PresentModel;
  const factory TodoListUseCaseOutput.presentItemDetail() = _PresentItemDetail;
}
