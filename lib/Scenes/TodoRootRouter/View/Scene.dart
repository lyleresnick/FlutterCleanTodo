//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoRootRouter.dart';

@visibleForTesting
class Scene extends StatefulWidget {
  final Presenter _presenter;

  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  late final Presenter _presenter;
  final navKey = GlobalKey<NavigatorState>();

  var _pages = <MaterialPage>[];

  @override
  void initState() {
    super.initState();
    this._presenter = widget._presenter;
    _pages = [
      MaterialPage(
          key: ValueKey("TodoList"),
          child: TodoList.Assembly(_presenter).scene),
    ];

    _presenter.stream.listen((event) {
      switch (event) {
        case PresenterOutput.showPop:
          navKey.currentState!.pop();
        default:
          _pages.add(event._page(_presenter));
          setState(() {
            _pages = _pages.toList();
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Presenter>(
        bloc: _presenter,
        child: Navigator(
          key: navKey,
          pages: _pages,
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }
            _pages.removeLast();
            setState(() {
              _pages = _pages.toList();
            });
            return true;
          },
        ));
  }
}

extension on PresenterOutput {
  MaterialPage _page(Presenter presenter) {
    return switch (this) {
      PresenterOutput.showRowDetail => MaterialPage(
          key: ValueKey("TodoItemRouter"),
          child: TodoItemRouter.Assembly(presenter).scene),
      _ => MaterialPage(
          key: ValueKey("ErrorScene"),
          child: ErrorScene(text: "Output not handled: '$this'"))
    };
  }
}
