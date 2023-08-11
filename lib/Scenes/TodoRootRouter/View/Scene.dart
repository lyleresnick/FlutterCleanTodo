//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoRootRouter.dart';

class Scene extends StatefulWidget {
  final Presenter _presenter;

  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  late final Presenter _presenter;
  final navKey = GlobalKey<NavigatorState>();

  static const _routeTodoItem = '/todoItem';
  static const _routeTodoList = '/';

  @override
  void initState() {
    super.initState();
    this._presenter = widget._presenter;
    _presenter.stream.listen((event) {
      switch (event) {
        case PresenterOutput.showPop:
          navKey.currentState!.pop();
        default:
          navKey.currentState!.pushNamed(event._route ?? event.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Presenter>(
        bloc: widget._presenter,
        child: Navigator(
          key: navKey,
          initialRoute: _routeTodoList,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(builder: _builderFromRoute(settings.name));
          },
        ));
  }

  Widget Function(BuildContext) _builderFromRoute(String? routeName) {
    return switch (routeName) {
      _routeTodoList => (_) => TodoList.Assembly(_presenter).scene,
      _routeTodoItem => (_) => TodoItemRouter.Assembly(_presenter).scene,
      _ => (_) => ErrorScene(text: "Invalid route: '$routeName'")
    };
  }
}

extension on PresenterOutput {
  String? get _route {
    return switch (this) {
      PresenterOutput.showRowDetail => _SceneState._routeTodoItem,
      _ => null
    };
  }
}
