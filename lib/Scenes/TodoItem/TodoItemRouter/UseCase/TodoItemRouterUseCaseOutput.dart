//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:freezed_annotation/freezed_annotation.dart';
part "TodoItemRouterUseCaseOutput.freezed.dart";

@freezed
class TodoItemRouterUseCaseOutput with _$TodoItemRouterUseCaseOutput  {
  const factory TodoItemRouterUseCaseOutput.presentEditView() = _PresentEditView;
  const factory TodoItemRouterUseCaseOutput.presentDisplayView() = _PresentDisplayView;
  const factory TodoItemRouterUseCaseOutput.presentNotFound(String id) = _PresentNotFound;
}


