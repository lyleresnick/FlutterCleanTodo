//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TodoList.dart';

@visibleForTesting
class Scene extends StatefulWidget {
  final Presenter _presenter;
  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  late final Presenter _presenter;
  final _plusKey = GlobalKey<StatefullyEnabledState>();

  @override
  void initState() {
    super.initState();
    this._presenter = widget._presenter;
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Scaffold(
        appBar: AppBar(
          title: Text(localizedString("todoList")),
          backgroundColor: Colors.lightGreen,
          elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
          actions: [
            StatefullyEnabled(
              key: _plusKey,
              builder: (context, enabled) => _AddTodoButton(
                enabled: enabled,
                onPressed: _presenter.eventCreate,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: BlocBuilderData<Presenter, _PresenterOutput>(
            bloc: _presenter,
            builder: (context, data) {
              switch (data) {
                case showLoading():
                  StatefullyEnabled.show(key: _plusKey, enabled: false);
                  return FullScreenLoadingIndicator();
                case showModel(:final model):
                  StatefullyEnabled.show(key: _plusKey, enabled: true);
                  return ListView.builder(
                      itemCount: model.rows.length,
                      itemBuilder: (context, index) =>
                          _Cell(row: model.rows[index], index: index));
              }
            },
          ),
        ));
  }
}

class _AddTodoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool enabled;

  const _AddTodoButton({
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = (enabled) ? this.onPressed : null;
    final disabledColor = Colors.white60;
    return (Theme.of(context).platform == TargetPlatform.iOS)
        ? IconButton(
            iconSize: 34,
            icon: Icon(CupertinoIcons.add),
            disabledColor: disabledColor,
            onPressed: onPressed,
          )
        : IconButton(
            icon: Icon(Icons.add),
            disabledColor: disabledColor,
            onPressed: onPressed,
          );
  }
}
