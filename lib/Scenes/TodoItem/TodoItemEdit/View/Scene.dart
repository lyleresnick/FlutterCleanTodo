//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemEdit.dart';

@visibleForTesting
class Scene extends StatefulWidget implements ActionDecoratedScene {
  final Presenter _presenter;

  Scene(this._presenter);

  @override
  State<Scene> createState() => _SceneState();

  @override
  List<Widget> actions() {
    return [SaveButton(onPressed: _presenter.eventSave)];
  }

  @override
  Widget leading() {
    return CancelButton(onPressed: _presenter.eventCancel);
  }

  @override
  bool get automaticallyImplyLeading => false;
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
    return BlocProvider<Presenter>(
        bloc: _presenter,
        child: StreamBuilder<_PresenterOutput>(
            stream: _presenter.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading ...");
              }

              switch (snapshot.data!) {
                case showModel(:final model):
                  if (model.errorMessage != null) {
                    _showTitleIsEmpty(context);
                  } else if (model.showEditCompleteBy) {
                    _showEditCompleteByPopover(context, model.completeBy!);
                  }

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: <Widget>[
                        _expandedRow(
                          localizedString("title"),
                          TodoTextField(
                            value: model.title,
                            placeholder: localizedString("enterATitle"),
                            onChanged: _presenter.eventEditedTitle,
                          ),
                        ),
                        _expandedRow(
                          localizedString("note"),
                          TodoTextField(
                            value: model.note,
                            minLines: 9,
                            maxLines: 9,
                            onChanged: _presenter.eventEditedNote,
                          ),
                        ),
                        _EditRow(
                            title: localizedString("completeBy"),
                            widget: Row(
                              children: <Widget>[
                                TodoSwitch(
                                  state: model.completeBySwitchIsOn,
                                  onChanged: (isOn) {
                                    if (isOn)
                                      _presenter.eventCompleteByToday();
                                    else
                                      _presenter.eventCompleteByClear();
                                  },
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
                        _expandedRow(
                          localizedString("priority"),
                          TodoExclusive(
                            value: model.priority,
                            itemNames: ["none", "low", "medium", "high"]
                                .map((value) => localizedString(value))
                                .toList(),
                            onValueChanged: _presenter.eventEditedPriority,
                          ),
                        ),
                        _EditRow(
                            title: localizedString("completed"),
                            widget: TodoSwitch(
                              state: model.completed,
                              onChanged: _presenter.eventCompleted,
                            ))
                      ]),
                    ),
                  );
              }
            }));
  }

  Widget _expandedRow(String title, Widget widget) {
    return _EditRow(title: title, widget: Expanded(child: widget));
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

  void _showTitleIsEmpty(BuildContext context) {
    TodoOkDialog.show(context, localizedString("titleRequiredTitle"),
        localizedString("titleRequiredMessage"));
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

class SaveButton extends StatelessWidget {
  final void Function()? onPressed;
  const SaveButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return (Platform.isIOS)
          ? CupertinoButton(
              child: Text(
                localizedString("save"),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: onPressed,
            )
          : IconButton(
              icon: Icon(Icons.save),
              onPressed: onPressed,
            );
    });
  }
}

class CancelButton extends StatelessWidget {
  final void Function()? onPressed;
  const CancelButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    final icon = (Platform.isIOS) ? Icons.clear : Icons.cancel;
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
