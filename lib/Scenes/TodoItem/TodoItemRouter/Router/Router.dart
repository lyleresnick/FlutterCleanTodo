//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

abstract interface class Router {
    void routeCreateItemCancelled();
    void routeItemPop();
}
