//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Presenter/TodoListPresenter.dart';
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
                        itemCount: presenter.rowCount,
                        itemBuilder: (context, index) {
                            return TodoListCell(viewModel: presenter.row(index), index: index, );
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
    void showTodoList() {
        setState(() {});
    }

// TodoListDeletePresenterOutput
    @override
    void showUndoDeleted(int index) {
        setState(() {});
    }

    // TodoListChangedPresenterOutput
    @override
    void showChanged(int index) {
        setState(() {});
    }

// TodoListCreatePresenterOutput
  @override
  void showAdded(int index) {
      setState(() {});
  }
}
