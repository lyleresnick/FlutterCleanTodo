//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/Scenes/Common/ActionDecoratedScene.dart';
import 'package:flutter_todo/Scenes/Common/BlocProvider.dart';
import 'package:flutter_todo/Scenes/Common/CupertinoPopoverDatePicker.dart';
import 'package:flutter_todo/Scenes/Common/Localize.dart';
import 'package:flutter_todo/Scenes/Common/TodoExclusive.dart';
import 'package:flutter_todo/Scenes/Common/TodoOkDialog.dart';
import 'package:flutter_todo/Scenes/Common/TodoSwitch.dart';
import 'package:flutter_todo/Scenes/Common/TodoTextField.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Presenter/TodoItemEditPresenter.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEdit/Presenter/TodoItemEditPresenterOutput.dart';

class TodoItemEditScene extends StatelessWidget implements ActionDecoratedScene {
  final TodoItemEditPresenter _presenter;

  TodoItemEditScene(this._presenter) {
      _presenter.eventViewReady();
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoItemEditPresenter>(
      bloc: _presenter,
      child: SingleChildScrollView(
        child: StreamBuilder<TodoItemEditPresenterOutput>(
            stream: _presenter.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading ...");
              }
              final data = snapshot.data;
              if (data is ShowModel) {
                final model = data.model;
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: <Widget>[
                    _expandedRow(
                      localizeString("title"),
                      TodoTextField(
                        value: model.title,
                        placeholder: localizeString("enterATitle"),
                        onChanged: _presenter.eventEditedTitle,
                      ),
                    ),
                    _expandedRow(
                      localizeString("note"),
                      TodoTextField(
                        value: model.note,
                        minLines: 9,
                        maxLines: 9,
                        onChanged: _presenter.eventEditedNote,
                      ),
                    ),
                    _EditRow(
                      title: localizeString("completeBy"), 
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
                              onTap: !model.completeBySwitchIsOn ? null : () => _presenter.eventEnableEditCompleteBy(context),
                              child: Text(model.completeByString,
                                  style: TextStyle(fontSize: 17))),
                        ],
                      )),
                    _expandedRow(
                      localizeString("priority"),
                      TodoExclusive(
                        value: model.priority,
                        itemNames: ["none", "low", "medium", "high"]
                            .map((value) => localizeString(value))
                            .toList(),
                        onValueChanged: _presenter.eventEditedPriority,
                      ),
                    ),
                    _EditRow(
                      title: localizeString("completed"), 
                      widget: TodoSwitch(
                        state: model.completed,
                        onChanged: _presenter.eventCompleted,
                      ))
                  ]),
                );
              }
              else
                return null;
            }),
      ),
    );
  }

  Widget _expandedRow(String title, Widget widget) {
    return _EditRow(title: title, widget: Expanded(child: widget));
  }

  static void showEnableEditCompleteBy(TodoItemEditPresenter presenter, DateTime completeBy) async {
    if (Platform.isIOS)
      CupertinoPopoverDatePicker().show(completeBy, presenter.buildContext,
          presenter.eventEditedCompleteBy, localizeString("set"));
    else {
      final newCompleteBy = await showDatePicker(
          context: presenter.buildContext,
          firstDate:
              DateTime.now().isBefore(completeBy) ? DateTime.now() : completeBy,
          initialDate: completeBy,
          lastDate: DateTime(2030));
      if (newCompleteBy != null) presenter.eventEditedCompleteBy(newCompleteBy);
    }
  }

  static void showTitleIsEmpty(TodoItemEditPresenter presenter) {
    TodoOkDialog.show(presenter.buildContext, localizeString("titleRequiredTitle"),
        localizeString("titleRequiredMessage"));
  }
}

class _EditRow extends StatelessWidget {
  const _EditRow({@required this.title, @required this.widget,});

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

  final Function(BuildContext) onPressed;
  const SaveButton({this.onPressed});

  @override
  Widget build(BuildContext context) {

    return Builder(
      builder: (context) {
        return (Platform.isIOS)
            ? CupertinoButton(
                child: Text(localizeString("save"),
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () => onPressed(context),
              )
            : IconButton(
                icon: Icon(Icons.save),
                onPressed: () => onPressed(context),
              );
      }
    );
  }
}

class CancelButton extends StatelessWidget {

  final Function onPressed;
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
