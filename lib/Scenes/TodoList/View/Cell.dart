part of '../TodoList.dart';

class Cell extends StatelessWidget {

    final RowViewModel row;
    final int index;

    Cell({required this.row, required this.index});

    @override
    Widget build(BuildContext context) {

        final presenter = BlocProvider.of<Presenter>(context)!;

        return Dismissible(
            key: UniqueKey(),
            child: GestureDetector(
                onTap: () {
                    presenter.eventItemSelected(index);
                },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey[300]!))
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
                              child: Text(row.priority,
                                  style: _textStylePriority(),
                                  textAlign: TextAlign.end,
                              )
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                Text(row.title, style: _textStyleTitle()),
                                Text(row.completeBy, style: _textStyleDetail()),
                            ],
                          ),
                      ]
                  ),
                )
            ),
            ),
          onDismissed: (direction) {
              presenter.eventDelete(index);
          },
          background: _dismissReveal(context),
      );
    }

    Widget _pictureBox(BuildContext context) {

        return Container(
            padding: EdgeInsets.all(4),
            child: CheckBox(
                checked: row.completed,
                onPressed: (checked) {
                    final presenter = BlocProvider.of<Presenter>(context)!;
                    if(checked)
                        presenter.eventCompleted(index);
                    else
                        presenter.eventNotCompleted(index);
                },
            ),
        );
    }

    TextStyle _textStylePriority() {
        return TextStyle(
            color: Colors.redAccent,
            fontSize: 17,
        );
    }

    TextStyle _textStyleTitle() {
        return TextStyle(
            color: Colors.black,
            fontSize: 17,
        );
    }

    TextStyle _textStyleDetail() {
        return TextStyle(
            color: Colors.black,
            fontSize: 15,
        );
    }

    Widget _dismissReveal(BuildContext context) {
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