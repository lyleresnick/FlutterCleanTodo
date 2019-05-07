import 'package:flutter/material.dart';
import '../Presenter/TodoItemEditPresenter.dart';

class TodoItemEditSceneInherited extends InheritedWidget {
    final TodoItemEditPresenter presenter;

    TodoItemEditSceneInherited({
        Key key,
        @required this.presenter,
        @required Widget child,
    }) : assert(presenter != null),
                assert(child != null),
                super(key: key, child: child);

    @override
    bool updateShouldNotify(TodoItemEditSceneInherited oldWidget) => false;

    static TodoItemEditSceneInherited of(context) {
        return context.inheritFromWidgetOfExactType(TodoItemEditSceneInherited) as TodoItemEditSceneInherited;
    }
}
