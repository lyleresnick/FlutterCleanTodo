//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

class Scene extends StatefulWidget {
  final Presenter _presenter;

  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();
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
    final platform = Theme.of(context).platform;
    return WillPopScope(
        onWillPop: _presenter.eventBack,
        child: BlocProvider<Presenter>(
            bloc: _presenter,
            child: StreamBuilder<PresenterOutput>(
                stream: _presenter.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Material(color: Colors.black);
                  }
                  final body = switch (snapshot.data!) {
                    showDisplayView() =>
                      TodoItemDisplay.Assembly(_presenter).scene,
                    showEditView() => TodoItemEdit.Assembly(_presenter).scene,
                    showMessageView(:final id) => Text(id)
                  };

                  final decoratedScene = (body is ActionDecoratedScene)
                      ? body as ActionDecoratedScene
                      : null;
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(_presenter.titleLabel),
                      backgroundColor: Colors.lightGreen,
                      elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
                      actions: decoratedScene?.actions(),
                      leading: decoratedScene?.leading(),
                      automaticallyImplyLeading:
                          decoratedScene?.automaticallyImplyLeading ?? false,
                    ),
                    body: body,
                  );
                })));
  }
}
