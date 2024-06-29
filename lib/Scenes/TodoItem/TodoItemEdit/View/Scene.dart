//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

@visibleForTesting
class Scene extends StatefulWidget implements ActionDecoratedScene {
  final Presenter _presenter;
  final _saveKey = GlobalKey<StatefullySetState>();
  final _cancelKey = GlobalKey<StatefullySetState>();
  final _editKey = GlobalKey<StatefullySetState>();

  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();

  @override
  Widget get title {
    return StatefullySet<String>(
        key: _editKey, builder: (context, value) => Text(value, style: TextStyle(color: Colors.white)));
  }

  @override
  List<Widget> get actions {
    return [
      StatefullySet<bool>(
        key: _saveKey,
        builder: (context, enabled) => _SaveButton(
          enabled: enabled,
          onPressed: _presenter.eventSave,
        ),
      )
    ];
  }

  @override
  Widget get leading {
    return StatefullySet<bool>(
        key: _cancelKey,
        builder: (context, enabled) => _CancelButton(
              enabled: enabled,
              onPressed: _presenter.eventCancel,
            ));
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
          switch (data) {
            case showModel(:final model):
              if (model.showEditCompleteBy)
                _showEditCompleteByPopover(context, model.completeBy!);
              if (model.errorMessage != null)
                _showDialog(context, model.errorMessage!);

              StatefullySet.value(
                  key: widget._saveKey, value: !model.isWaiting);
              StatefullySet.value(
                  key: widget._cancelKey, value: !model.isWaiting);
              StatefullySet.value(
                  key: widget._editKey,
                  value: localizedString(model.modeTitle));

              return Waiting(
                isWaiting: model.isWaiting,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: <Widget>[
                      _EditRow(
                          title: localizedString("title"),
                          widget: Expanded(
                              child: TodoTextField(
                            value: model.title,
                            placeholder: localizedString("enterATitle"),
                            onChanged: _presenter.eventEditedTitle,
                          ))),
                      _EditRow(
                          title: localizedString("note"),
                          widget: Expanded(
                              child: TodoTextField(
                            value: model.note,
                            minLines: 9,
                            maxLines: 9,
                            onChanged: _presenter.eventEditedNote,
                          ))),
                      _EditRow(
                          title: localizedString("completeBy"),
                          widget: Row(
                            children: <Widget>[
                              TodoSwitch(
                                state: model.completeBySwitchIsOn,
                                onChanged: _presenter.eventCompleteBy,
                              ),
                              Container(width: 6),
                              GestureDetector(
                                  onTap: !model.completeBySwitchIsOn
                                      ? null
                                      : _presenter.eventEnableEditCompleteBy,
                                  child: Text(model.completeByString,
                                      style: TextStyle(fontSize: 17))),
                            ],
                          )),
                      _EditRow(
                          title: localizedString("priority"),
                          widget: Expanded(
                              child: TodoExclusive(
                            value: model.priority,
                            itemNames: ["none", "low", "medium", "high"]
                                .map((value) => localizedString(value))
                                .toList(),
                            onValueChanged: _presenter.eventEditedPriority,
                          ))),
                      _EditRow(
                          title: localizedString("completed"),
                          widget: TodoSwitch(
                            state: model.completed,
                            onChanged: _presenter.eventCompleted,
                          ))
                    ]),
                  ),
                ),
              );
          }
        });
  }

  void _showEditCompleteByPopover(BuildContext context, DateTime completeBy) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (Platform.isIOS)
        CupertinoPopoverDatePicker().show(completeBy, context,
            _presenter.eventEditedCompleteBy, localizedString("set"));
      else {
        final newCompleteBy = await showDatePicker(
            context: context,
            firstDate: DateTime.now().isBefore(completeBy)
                ? DateTime.now()
                : completeBy,
            initialDate: completeBy,
            lastDate: DateTime(2030));
        if (newCompleteBy != null)
          _presenter.eventEditedCompleteBy(newCompleteBy);
      }
    });
  }

  void _showDialog(BuildContext context, ErrorMessage errorMessage) {
    TodoOkDialog.show(context, localizedString(errorMessage.titleToken),
        localizedString(errorMessage.messageToken));
  }
}

class _EditRow extends StatelessWidget {
  const _EditRow({
    required this.title,
    required this.widget,
  });

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: (Platform.isIOS) ? 7.0 : 11.0),
              child: SizedBox(
                width: 120,
                child: Text(title + ':', style: TextStyle(fontSize: 17)),
              ),
            ),
            widget,
          ]),
    );
  }
}

class _SaveButton extends StatelessWidget {
  final void Function() onPressed;
  final bool enabled;
  const _SaveButton({required this.onPressed, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final onPressed = (enabled) ? this.onPressed : null;
      final disabledColor = Colors.white60;
      return (Platform.isIOS)
          ? CupertinoButton(
              child: Text(
                localizedString("save"),
                style: TextStyle(
                    fontSize: 18,
                    color: enabled ? Colors.white : disabledColor),
              ),
              onPressed: onPressed,
            )
          : IconButton(
              icon: Icon(Icons.save),
              color: Colors.white,
              disabledColor: disabledColor,
              onPressed: onPressed,
            );
    });
  }
}

class _CancelButton extends StatelessWidget {
  final void Function() onPressed;
  final bool enabled;
  const _CancelButton({required this.onPressed, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon((Platform.isIOS) ? Icons.clear : Icons.cancel),
      color: Colors.white,
      onPressed: (enabled) ? this.onPressed : null,
      disabledColor: Colors.white60,
    );
  }
}
