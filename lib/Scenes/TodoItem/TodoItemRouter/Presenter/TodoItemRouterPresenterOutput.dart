//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:freezed_annotation/freezed_annotation.dart';
part "TodoItemRouterPresenterOutput.freezed.dart";

@freezed
class TodoItemRouterPresenterOutput with _$TodoItemRouterPresenterOutput  {
  const factory TodoItemRouterPresenterOutput.showEditView() = _ShowEditView;
  const factory TodoItemRouterPresenterOutput.showDisplayView() = _ShowDisplayView;
  const factory TodoItemRouterPresenterOutput.showMessageView(String id) = _ShowMessageView;
}

