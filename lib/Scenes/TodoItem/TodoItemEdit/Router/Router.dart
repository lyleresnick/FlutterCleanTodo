//  Copyright (c) 2018 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

abstract interface class Router {
    void routeEditingCancelled();
    void routeSaveCompleted();
    void routeCreateCancelled();
}
