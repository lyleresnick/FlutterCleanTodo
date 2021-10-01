//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/View/TodoRootRouterScene.dart';

class TodoRootRouterAssembly {

    final TodoRootRouterScene scene;
    TodoRootRouterAssembly._(this.scene);

    factory TodoRootRouterAssembly() {

        final presenter = TodoRootRouterPresenter();
        final scene = TodoRootRouterScene(presenter);

        return TodoRootRouterAssembly._(scene);
    }
}