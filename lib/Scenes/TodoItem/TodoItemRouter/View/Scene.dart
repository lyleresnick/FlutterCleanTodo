//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

@visibleForTesting
class Scene extends StatefulWidget implements ActionDecoratedScene {
  final Presenter _presenter;
  final _actionKeys = [GlobalKey<StatefullySetState>(), GlobalKey<StatefullySetState>()];
  final _leadingKey = GlobalKey<StatefullySetState>();
  final _titleKey = GlobalKey<StatefullySetState>();

  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();

  @override
  List<Widget>? get actions  => [
    StatefullySet<Widget>(
        key: _actionKeys[0],
        builder: (context, value) => value
    ),
  ];

  @override
  Widget? get leading => StatefullySet<Widget>(
      key: _leadingKey,
      builder: (context, value) => value
  );

  @override
  Widget get title => StatefullySet<Widget>(
      key: _titleKey,
      builder: (context, value) => value
  );
}

class _SceneState extends State<Scene> {
  late final Presenter _presenter;

  @override
  void initState() {
    super.initState();
    this._presenter = widget._presenter;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Presenter, _PresenterOutput>(
        bloc: _presenter,
        builder: (context, data) {
          final body = switch (data) {
            showLoading() => FullScreenLoadingIndicator(),
            showDisplayView() => TodoItemDisplay.Assembly(_presenter).scene,
            showEditView() => TodoItemEdit.Assembly(_presenter).scene,
            showMessageView(:final message) => Center(child: Text(message))
          };
          final decoratedScene = (body is ActionDecoratedScene)
              ? body as ActionDecoratedScene
              : null;
          if(decoratedScene != null) {
            final actions = decoratedScene.actions;
            if(actions != null) {
              actions.asMap().forEach((index, action) => StatefullySet.value(key: widget._actionKeys[index], value: action));
            }
            StatefullySet.value(key: widget._leadingKey, value: decoratedScene.leading);
            StatefullySet.value(key: widget._titleKey, value: decoratedScene.title);
          }
          return  body;
        });
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}
