//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoRootRouter.dart';

class Assembly {

    final Scene scene;
    Assembly._(this.scene);

    factory Assembly() {

        final presenter = Presenter();
        final scene = Scene(presenter);

        return Assembly._(scene);
    }
}