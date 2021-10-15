//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:freezed_annotation/freezed_annotation.dart';
part "TodoRootRouterPresenterOutput.freezed.dart";

@freezed
class TodoRootRouterPresenterOutput with _$TodoRootRouterPresenterOutput  {
  const factory TodoRootRouterPresenterOutput.showPop() = _ShowPop;
  const factory TodoRootRouterPresenterOutput.showRowDetail() = _ShowRowDetail;
}
