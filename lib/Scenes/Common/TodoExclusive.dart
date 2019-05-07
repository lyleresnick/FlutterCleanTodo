//  Copyright (c) 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TodoExclusive extends StatefulWidget {

    final int value;
    final void Function(int) onValueChanged;
    final List<String> itemNames;

    TodoExclusive({@required this.value, @required this.itemNames, @required this.onValueChanged});

    @override
    State<StatefulWidget> createState()  => TodoExclusiveState();

}

class TodoExclusiveState extends State<TodoExclusive> {

    int _value;
    Map<int,Text> _cupertinoItems;

    @override
    void initState() {
        super.initState();
        _value = widget.value;
        _cupertinoItems = _makeSegmentedControlChildren(widget.itemNames);
    }

    @override
    Widget build(BuildContext context) {

        final platform = Theme.of(context).platform;

        void onChanged(int value) {
            setState(() {
                _value = value;
            });
            widget.onValueChanged(value);
        }

        return  (platform == TargetPlatform.iOS)
          ? ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 44),
                child: CupertinoSegmentedControl(
                  groupValue: _value,
//                      selectedColor: Colors.green,
//                      pressedColor: Colors.red,
//                      unselectedColor: Colors.white,
//                      borderColor: Colors.green,

                  children: _cupertinoItems,
                  onValueChanged: onChanged,
              ),
            )
          : Column(
              children: _makeRadioTiles(_value, widget.itemNames, onChanged)
          );
    }


    Map<int,Text> _makeSegmentedControlChildren(List<String> titles) {

        final children = Map<int,Text>();
        var index = 0;
        for(var title in titles) {
            children[index] = Text(title, style: TextStyle(fontSize: 13));
            index++;
        }
        return children;
    }

    List<RadioListTile> _makeRadioTiles(int groupValue, List<String> titles, Function(int) onChanged) {

        final children = List<RadioListTile>();
        var index = 0;
        for(var title in titles) {
            final tile = RadioListTile(
                value: index,
                groupValue: groupValue,
                title: Text(title,
                    style: TextStyle(fontSize: 15)
                ),
                onChanged: onChanged,
            );
            children.add(tile);
            index++;
        }
        return children;

    }


}