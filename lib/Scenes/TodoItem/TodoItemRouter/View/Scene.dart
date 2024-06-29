//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemRouter.dart';

@visibleForTesting
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
    return BlocBuilderData<Presenter, _PresenterOutput>(
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
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                  color: Colors.white
              ),
              title: decoratedScene?.title ?? Text(localizedString('todo'), style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.lightGreen,
              elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
              actions: decoratedScene?.actions,
              leading: decoratedScene?.leading,
            ),
            body: body,
          );
        });
  }
}
