//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoRootRouter.dart';

class Scene extends StatelessWidget {
  final Presenter _presenter;
  final navKey = GlobalKey<NavigatorState>();

  static const _routeTodoItem = '/todoItem';
  static const _routeTodoList = '/';

  Scene(this._presenter) {
    _presenter.stream.listen((event) {
      switch (event) {
        case PresenterOutput.showRowDetail:
          navKey.currentState!.pushNamed(_routeTodoItem);
        case PresenterOutput.showPop:
          navKey.currentState!.pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Presenter>(
        bloc: _presenter,
        child: Navigator(
          key: navKey,
          initialRoute: _routeTodoList,
          onGenerateRoute: (settings) {
            late WidgetBuilder builder;
            switch (settings.name) {
              case _routeTodoList:
                builder = (_) => TodoList.Assembly(_presenter).scene;
                break;
              case _routeTodoItem:
                builder = (_) => TodoItemRouter.Assembly(_presenter).scene;
                break;
              default:
                assert(false, 'Invalid route: ${settings.name}');
            }
            return MaterialPageRoute(builder: builder);
          },
        ));
  }
}
