//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemStartMode.dart';
import 'package:flutter_todo/Scenes/TodoItem/TodoItemEditMode.dart';

import '../Presenter/TodoItemRouterPresenter.dart';
import '../Presenter/TodoItemRouterPresenterOutput.dart';
import '../Assembly/TodoItemRouterAssembly.dart';

import '../../TodoItemDisplay/View/TodoItemDisplayScene.dart';
import '../../TodoItemEdit/View/TodoItemEditScene.dart';
import '../../TodoItemRouter/Router/TodoItemRouterRouter.dart';
import '../../../Common/ActionDecoratedScene.dart';

class TodoItemRouterScene extends StatefulWidget {

    final TodoItemRouterPresenter presenter;

    TodoItemRouterScene({@required this.presenter});

    @override
    State<StatefulWidget> createState()  => TodoItemRouterSceneState();

    factory TodoItemRouterScene.assembled({@required TodoItemRouterRouter router, @required TodoItemStartMode startMode}) {
        return TodoItemRouterAssembly(router, startMode).scene;
    }

}

enum _ViewConfiguration {
    init,
    display,
    edit,
    message
}

class TodoItemRouterSceneState extends State<TodoItemRouterScene> implements TodoItemRouterPresenterOutput {

    TodoItemRouterPresenter presenter;
    var _viewConfiguration = _ViewConfiguration.init;
    TodoItemEditMode _editMode;
    String _message;

    @override
    void initState() {
        super.initState();
        presenter = widget.presenter;
        presenter.output = this;

        presenter.eventViewReady();
    }

    @override
    Widget build(BuildContext context) {

        final platform = Theme.of(context).platform;
        final body = makeBody();
        final decoratedScene = (body is ActionDecoratedScene) ? body as ActionDecoratedScene: null;
        return WillPopScope(
          onWillPop: presenter.eventBack,
          child: Scaffold(
              appBar: AppBar(
                  title: Text(presenter.titleLabel),
                  backgroundColor: Colors.lightGreen,
                  elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
                  actions: decoratedScene?.actions(platform),
                  leading: decoratedScene?.leading(platform),
                  automaticallyImplyLeading: decoratedScene?.automaticallyImplyLeading ?? false,
              ),
              body: body,
          ),
        );
    }



    Widget makeBody() {
        switch(_viewConfiguration) {
        case _ViewConfiguration.init:
            return Container();
        case _ViewConfiguration.edit:
            return TodoItemEditScene.assembled(router: presenter, editMode: _editMode);
        case _ViewConfiguration.display:
            return TodoItemDisplayScene.assembled(router: presenter);
        case _ViewConfiguration.message:
            return Text(_message);
        default:
            assert(false, "_viewConfiguration is: $_viewConfiguration");
            return null;
        }
    }

    // TodoItemRouterViewReadyPresenterOutput

    // TodoItemRouterViewReadyPresenterOutput

    @override
    void showViewReady(TodoItemStartMode startMode) {
        setState(() {
            switch(startMode.runtimeType) {
            case TodoItemStartModeCreate:
                _viewConfiguration = _ViewConfiguration.edit;
                _editMode = TodoItemEditMode.create;
                _message = null;
                break;
            case TodoItemStartModeUpdate:
                _configureDisplayView();
                break;
            }
        });
    }

    @override
    void showMessageView(String message) {
        setState(() {
            _viewConfiguration = _ViewConfiguration.message;
            _editMode = null;
            _message = message;
        });
    }

    //  TodoItemRouterDisplayPresenterOutput
    @override
    void showDisplayView() {
        setState(() {
            _configureDisplayView();
        });
    }

    void _configureDisplayView() {
        _viewConfiguration = _ViewConfiguration.display;
        _editMode = null;
        _message = null;

    }

    // TodoItemRouterEditPresenterOutput
    @override
    void showEditView() {
        setState(() {
            _viewConfiguration = _ViewConfiguration.edit;
            _editMode = TodoItemEditMode.update;
            _message = null;
        });
    }
}

