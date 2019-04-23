//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import '../Presenter/TodoListPresenter.dart';
import '../Presenter/TodoListPresenterOutput.dart';
import '../Assembly/TodoListAssembly.dart';
import 'TodoListCell.dart';
import 'TodoListSceneInherited.dart';


class TodoListScene extends StatefulWidget {
    final TodoListPresenter presenter;

    TodoListScene({@required this.presenter});

    @override
    State<StatefulWidget> createState() => TodoListSceneState();

    factory TodoListScene.assembled() {
        return TodoListAssembly().scene;
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
        return TodoListSceneInherited(
            presenter: presenter,
            child: Scaffold(
                appBar: AppBar(
                    title: Text('Todo List'),
                    backgroundColor: Colors.lightGreen,
                    elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
                ),
                body: ListView.builder(
                        itemCount: presenter.rowCount,
                        itemBuilder: (context, index) {
                            return TodoListCell(viewModel: presenter.row(index), index: index, );
                        }),
            ),
        );
    }

// TodoListPresenterOutput

// TodoListCreatePresenterOutput
  @override
  void showAdded(int index) {
    // TODO: implement showAdded
  }

// TodoListChangedPresenterOutput
  @override
  void showChanged(int index) {
    // TODO: implement showChanged
  }

// TodoListDeletePresenterOutput
  @override
  void showUndoDeleted(int index) {
      setState(() {});
  }

// TodoListViewReadyPresenterOutput
  @override
  void showTodoList() {
      setState(() {});
  }
}
