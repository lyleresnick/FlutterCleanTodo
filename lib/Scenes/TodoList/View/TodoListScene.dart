//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Presenter/TodoListPresenter.dart';
import '../Presenter/TodoListRowViewModel.dart';
import '../Presenter/TodoListPresenterOutput.dart';
import '../Assembly/TodoListAssembly.dart';
import 'TodoListCell.dart';
import 'TodoListSceneInherited.dart';
import '../../TodoList/Router/TodoListRouter.dart';

class TodoListScene extends StatefulWidget {
    final TodoListPresenter presenter;

    TodoListScene({@required this.presenter});

    @override
    State<StatefulWidget> createState() => TodoListSceneState();

    factory TodoListScene.assembled({TodoListRouter router}) {
        return TodoListAssembly(router).scene;
    }
}

class TodoListSceneState extends State<TodoListScene> implements TodoListPresenterOutput {

    TodoListPresenter presenter;
    List<TodoListRowViewModel> _rows = [];

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
        return TodoListSceneInherited(
            presenter: presenter,
            child: Scaffold(
                appBar: AppBar(
                    title: Text(presenter.titleLabel),
                    backgroundColor: Colors.lightGreen,
                    elevation: platform == TargetPlatform.iOS ? 0.0 : 4.0,
                    actions: _actions(platform),
                ),
                body: ListView.builder(
                        itemCount: _rows.length,
                        itemBuilder: (context, index) {
                            return TodoListCell(row: _rows[index], index: index, );
                        }),
            ),
        );
    }

    List<Widget>  _actions(TargetPlatform platform) {
        return [
            (platform == TargetPlatform.iOS )
                ? IconButton(
                    iconSize: 34,
                    icon: Icon(CupertinoIcons.add),
                    onPressed: presenter.eventCreate,
                )

                :  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: presenter.eventCreate,
                )
        ];
    }

// TodoListPresenterOutput

// TodoListViewReadyPresenterOutput
    @override
    void showTodoList(List<TodoListRowViewModel> rows) {
        setState(() {
            _rows = rows;
        });
    }

// TodoListDeletePresenterOutput
    @override
    void showUndoDeleted(List<TodoListRowViewModel> rows, int index) {
        setState(() {
            _rows = rows;
        });
    }

    @override
    void showDeleted(List<TodoListRowViewModel> rows, int index) {
        setState(() {
            _rows = rows; // remove dismissible from tree
        });
    }

    // TodoListChangedPresenterOutput
    @override
    void showChanged(List<TodoListRowViewModel> rows, int index) {
        setState(() {
            _rows = rows;
        });
    }

// TodoListCreatePresenterOutput
  @override
  void showAdded(List<TodoListRowViewModel> rows, int index) {
      setState(() {
          _rows = rows;
      });
  }

// TodoListCompletePresenterOutput
    @override
  void showCompleted(List<TodoListRowViewModel> rows, int index) {
        _rows = rows;

        // the output was previously updated due to the immediate toggle state change
        // if this were not the case, an async call would delay the update of the screen
        // if a network error occurs or it turns out the item was deleted by another user,
        // the app should present a message about the situation and, in the former case,
        // reset the button to the previous state; in the latter case the item should be deleted
    }
}
