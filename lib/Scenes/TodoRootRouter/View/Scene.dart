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
  final _navKey = GlobalKey<NavigatorState>();
  var _pages = <MaterialPage>[];

  @override
  void initState() {
    super.initState();
    this._presenter = widget._presenter;
    _pages = [
      MaterialPage(
          key: ValueKey("TodoList"),
          child: NavigatorScaffold(
              child: TodoList.Assembly(_presenter).scene)),
    ];

    _presenter.stream.listen((event) {
      switch (event) {
        case PresenterOutput.showPop:
          _navKey.currentState!.pop();
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
    return Navigator(
      key: _navKey,
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
    );
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}

extension on PresenterOutput {
  MaterialPage _page(Presenter presenter) {
    return switch (this) {
      PresenterOutput.showRowDetail => MaterialPage(
          key: ValueKey("TodoItemRouter"), child: NavigatorScaffold(child: TodoItemRouter.Assembly(presenter).scene)),
      _ => MaterialPage(
          key: ValueKey("ErrorScene"), child: NavigatorScaffold(child: ErrorScene(text: "Output not handled: '$this'")))
    };
  }
}

class NavigatorScaffold extends StatelessWidget {
  final Widget child;

  NavigatorScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final decoratedScene = (child is ActionDecoratedScene) ? child as ActionDecoratedScene : null;

    return Scaffold(
      appBar: AppBar(
        title: decoratedScene?.title,
        backgroundColor: Colors.lightGreen,
        elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
        centerTitle: platform == TargetPlatform.iOS,
        actions: decoratedScene?.actions,
        leading: decoratedScene?.leading,
      ),
      body: child,
    );
  }
}
