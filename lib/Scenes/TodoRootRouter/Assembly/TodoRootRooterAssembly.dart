//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_todo/Scenes/TodoRootRouter/Presenter/TodoRootRouterPresenter.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/View/TodoRootRouterScene.dart';

class TodoRootRouterAssembly {

    final TodoRootRouterScene scene;
    final TodoRootRouterPresenter presenter;

    TodoRootRouterAssembly._({this.scene, this.presenter});

    factory TodoRootRouterAssembly() {

        final presenter = TodoRootRouterPresenter();
        final scene = TodoRootRouterScene(presenter: presenter);

        return TodoRootRouterAssembly._(scene: scene, presenter: presenter);
    }
}