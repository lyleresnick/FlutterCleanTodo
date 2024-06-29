//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

@visibleForTesting
class Scene extends StatefulWidget implements ActionDecoratedScene {
  final Presenter _presenter;

  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();

  @override
  Widget? get leading {
    return null;
  }

  @override
  Widget get title {
    return Text(localizedString('todo'), style: TextStyle(color: Colors.white));
  }

  @override
  List<Widget> get actions {
    return [
      _EditButton(
          label: _presenter.editLabel, onPressed: _presenter.eventModeEdit)
    ];
  }
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
    return BlocBuilderData<Presenter, _PresenterOutput>(
        bloc: _presenter,
        builder: (context, data) {
          return switch (data) {
            showFieldList(:final model) => ListView.builder(
                itemCount: model.length,
                itemBuilder: (BuildContext context, int i) {
                  return _Row(row: model[i]);
                },
              )
          };
        });
  }
}

class _Row extends StatelessWidget {
  const _Row({
    Key? key,
    required this.row,
  }) : super(key: key);

  final RowViewModel row;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 130),
                child: Text(
                  "${row.fieldName}:",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Expanded(
                child: Text(
                  row.value,
                  softWrap: true,
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _EditButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const _EditButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoButton(
            child: Text(
              label,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: onPressed,
          )
        : IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            onPressed: onPressed,
          );
  }
}
