import 'package:flutter/material.dart';
import '../Presenter/TodoListRowViewModel.dart';
import 'TodoListSceneInherited.dart';
import 'CheckBox.dart';
import 'package:uuid/uuid.dart';


class TodoListCell extends StatelessWidget {

    final TodoListRowViewModel viewModel;
    final int index;

    TodoListCell({@required this.viewModel, @required this.index});

    @override
    Widget build(BuildContext context) {

        final presenter = TodoListSceneInherited.of(context)?.presenter;

        return Dismissible(
            key: Key(Uuid().v1()),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey[300]))
              ),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        _pictureBox(context),
                        Container(
                            padding: EdgeInsets.only(right: 4),
                            width: 30,
                            child: Text(viewModel.priority,
                                    style: textStylePriority(),
                                    textAlign: TextAlign.end,
                            )
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Text(viewModel.title, style: textStyleTitle()),
                              Text(viewModel.completeBy, style: textStyleDetail()),
                          ],
                        ),
                    ]
                ),
              )
          ),
          onDismissed: (direction) {
              presenter.eventDelete(index);
          },
            background: dismissReveal(context),

      );
    }

    Widget _pictureBox(BuildContext context) {

        return Container(
            padding: EdgeInsets.all(4),
            child: CheckBox(
                checked: viewModel.completed,
                onPressed: (checked) {
                    final presenter = TodoListSceneInherited.of(context).presenter;
                    if(checked)
                        presenter.eventCompleted(index);
                    else
                        presenter.eventNotCompleted(index);
                    print("clicked $checked");
                },
            ),
        );
    }

    TextStyle textStylePriority() {
        return TextStyle(
            color: Colors.redAccent,
            fontSize: 17,
        );
    }

    TextStyle textStyleTitle() {
        return TextStyle(
            color: Colors.black,
            fontSize: 17,
        );
    }

    TextStyle textStyleDetail() {
        return TextStyle(
            color: Colors.black,
            fontSize: 15,
        );
    }

    Widget dismissReveal(BuildContext context) {
        return Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16.0),
            color: Colors.red,
            child: Theme.of(context).platform == TargetPlatform.iOS
              ? Text("Delete",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15)
                )
              : Icon(
                    Icons.delete,
                    color: Colors.white,
                ),
        );
    }


}