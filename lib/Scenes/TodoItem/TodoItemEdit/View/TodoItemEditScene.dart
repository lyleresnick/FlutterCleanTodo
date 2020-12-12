//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/Scenes/Common/CupertinoPopoverDatePicker.dart';
import 'package:flutter_todo/Scenes/Common/TodoOkDialog.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';

import '../Assembly/TodoItemEditAssembly.dart';
import '../Presenter/TodoItemEditPresenter.dart';
import '../Presenter/TodoItemEditPresenterOutput.dart';
import '../Presenter/TodoItemEditViewModel.dart';
import '../Router/TodoItemEditRouter.dart';
import '../../../Common/ActionDecoratedScene.dart';
import '../../../Common/TodoSwitch.dart';
import '../../../Common/TodoExclusive.dart';
import '../../../Common/TodoTextField.dart';

class TodoItemEditScene extends StatefulWidget implements ActionDecoratedScene {

    final TodoItemEditPresenter presenter;

    TodoItemEditScene({@required this.presenter});

    @override
    State<StatefulWidget> createState()  => TodoItemEditSceneState();

    factory TodoItemEditScene.assembled({@required TodoItemEditRouter router, @required TodoItemEditMode editMode}) {
        return TodoItemEditAssembly(router, editMode).scene;
    }

    @override
    List<Widget> actions(TargetPlatform platform) {

        return [
            saveButton(presenter.saveLabel, platform)
        ];
    }

    @override
    Widget leading(TargetPlatform platform) {
        return cancelButton(platform);
    }

    Widget saveButton(String label, TargetPlatform platform) {

        return (platform == TargetPlatform.iOS )
            ? CupertinoButton(
                child: Text(label,
                    style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                    ),
                ),
                onPressed: presenter.eventSave,
            )
            :  IconButton(
                icon: Icon(Icons.save),
                onPressed: presenter.eventSave,
            );
    }

    Widget cancelButton(TargetPlatform platform) {

        final icon = (platform == TargetPlatform.iOS ) ? Icons.clear : Icons.cancel;
        return IconButton(
            icon: Icon(icon),
            onPressed: presenter.eventCancel,
        );
    }

  @override
  bool get automaticallyImplyLeading => false;

}

class TodoItemEditSceneState extends State<TodoItemEditScene> implements TodoItemEditPresenterOutput {

    TodoItemEditPresenter presenter;

    @override
    void initState() {
        super.initState();
        presenter = widget.presenter;
        presenter.output = this;

        presenter.eventViewReady();
    }

    String _completeByString = "";
    int _priority =  0;
    bool _completed = false;
    bool _completeBySwitchIsOn = false;

    String _title;
    String _note;
    List<String> _priorityLabels;
    String _titlePlaceholder;

    @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            children: <Widget>[
                _expandedRow(presenter.titleLabel,
                    TodoTextField(
                        value: _title,
                        placeholder: _titlePlaceholder,
                        onChanged: presenter.eventEditedTitle,
                    ),
                ),
                _expandedRow(presenter.noteLabel,
                    TodoTextField(
                        value: _note,
                        minLines: 9,
                        maxLines: 9,
                        onChanged: presenter.eventEditedNote,
                    ),
                ),
                _row(presenter.completeByLabel,
                    Row(
                      children: <Widget>[
                          TodoSwitch(
                              state: _completeBySwitchIsOn,
                              onChanged: (isOn) {
                                  if(isOn)
                                      presenter.eventCompleteByToday();
                                  else
                                      presenter.eventCompleteByClear();
                              },
                          ),
                          Container(width: 6),
                          GestureDetector(
                              onTap: presenter.eventEnableEditCompleteBy,
                              child: Text(_completeByString, style: TextStyle(fontSize: 17))),
                      ],
                    ),
                ),
                _expandedRow(presenter.priorityLabel,
                    TodoExclusive(
                        value: _priority,
                        itemNames: _priorityLabels,
                        onValueChanged: presenter.eventEditedPriority,
                    ),
                ),
                _row(presenter.completedLabel,
                    TodoSwitch(
                        state: _completed,
                        onChanged: presenter.eventCompleted,
                    ),
                )
            ]
        ),
      ),
    );
  }

  Widget _expandedRow(String title, Widget widget) {
        return _row(title, Expanded(child: widget));
  }

    Widget _row(String title, Widget widget) {

        final platform = Theme.of(context).platform;

        return Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                      padding: EdgeInsets.only(top: (platform == TargetPlatform.iOS) ? 7.0 : 11.0),
                      child: SizedBox( width: 120,
                        child: Text(title + ':',
                            style: TextStyle(fontSize: 17)
                        ),
                      ),
                    ),
                    widget,
                ]
            ),
      );
  }



//    TodoItemEditPresenterOutput

//    TodoItemEditViewReadyPresenterOutput

    @override
    void showModel(TodoItemEditViewModel model, String titlePlaceholder, List<String> priorityLabels) {
        setState(() {
            _title = model.title;
            _note = model.note;
            _completeBySwitchIsOn = model.completeBy != null;
            _completeByString = model.completeByString;
            _priority =  model.priority;
            _completed = model.completed;
            _priorityLabels = priorityLabels;
            _priorityLabels = priorityLabels;
            _titlePlaceholder = titlePlaceholder;
        });
    }

//    TodoItemEditCompleteByPresenterOutput
    @override
    void showCompleteByClear() {
        setState(() {
            _completeByString = "";
        });
    }

    @override
    void showEnableEditCompleteBy(DateTime completeBy) async {

        final platform = Theme.of(context).platform;
        if(platform == TargetPlatform.iOS)
            CupertinoPopoverDatePicker().show(completeBy, context, presenter.eventEditedCompleteBy, presenter.setLabel);
        else {

            final newCompleteBy = await showDatePicker(
                context: context,
                firstDate: DateTime.now().isBefore(completeBy) ? DateTime.now() : completeBy,
                initialDate: completeBy,
                lastDate: DateTime(2030)
            );
            if(newCompleteBy != null)
                presenter.eventEditedCompleteBy(newCompleteBy);

        }
    }

    @override
    void showCompleteBy(String completeBy) {

        setState(() {
            _completeByString = completeBy;
        });
    }

//    TodoItemEditSavePresenterOutput

    @override
    void showTitleIsEmpty(String alertTitle, String message) {
        TodoOkDialog.show(context, alertTitle, message);
    }

}

