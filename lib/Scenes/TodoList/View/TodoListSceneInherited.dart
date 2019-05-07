import 'package:flutter/material.dart';
import '../Presenter/TodoListPresenter.dart';

class TodoListSceneInherited extends InheritedWidget {
    final TodoListPresenter presenter;

    TodoListSceneInherited({
        Key key,
        @required this.presenter,
        @required Widget child,
    }) : assert(presenter != null),
                assert(child != null),
                super(key: key, child: child);

    @override
    bool updateShouldNotify(TodoListSceneInherited oldWidget) => false;

    static TodoListSceneInherited of(context) {
        return context.inheritFromWidgetOfExactType(TodoListSceneInherited) as TodoListSceneInherited;
    }
}
