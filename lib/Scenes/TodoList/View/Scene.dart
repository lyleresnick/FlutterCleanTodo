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
  final _plusKey = GlobalKey<StatefullySetState>();
  final _checkedKey = GlobalKey<StatefullySetState>();

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
          centerTitle: platform == TargetPlatform.iOS,
          backgroundColor: Colors.lightGreen,
          elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
          actions: [
            StatefullySet<bool>(
                key: _checkedKey,
                builder: (context, enabled) =>
                    _CheckedButton(enabled: enabled, onPressed: _presenter.eventShowCompleted)),
            StatefullySet<bool>(
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
                  StatefullySet.value(key: _plusKey, value: false);
                  StatefullySet.value(key: _checkedKey, value: false);
                  return FullScreenLoadingIndicator();
                case showModel(:final model):
                  StatefullySet.value(key: _plusKey, value: true);
                  StatefullySet.value(key: _checkedKey, value: true);
                  return ListView.builder(
                      itemCount: model.rows.length,
                      itemBuilder: (context, index) => _Cell(row: model.rows[index]));
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

class _CheckedButton extends StatefulWidget {
  final void Function(bool) onPressed;
  final bool enabled;

  const _CheckedButton({
    required this.enabled,
    required this.onPressed,
  });

  @override
  State<_CheckedButton> createState() => _CheckedButtonState();
}

class _CheckedButtonState extends State<_CheckedButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final icon =
        (platform == TargetPlatform.iOS) ? Icon(CupertinoIcons.checkmark_alt) : Icon(Icons.check);
    final selectedIcon = (platform == TargetPlatform.iOS)
        ? Icon(CupertinoIcons.checkmark_rectangle_fill)
        : Icon(Icons.check_box);
    return IconButton(
      icon: isSelected ? selectedIcon : icon,
      color: Colors.white,
      disabledColor: Colors.white60,
      onPressed: (widget.enabled)
          ? () {
              setState(() {
                isSelected = !isSelected;
              });
              widget.onPressed(isSelected);
            }
          : null,
    );
  }
}
