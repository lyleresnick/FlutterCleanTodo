//  Copyright (c) 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TodoSwitch extends StatefulWidget {

    final bool _state;
    final void Function(bool) _onChanged;

    TodoSwitch({required bool state, required Function(bool) onChanged})
            : _state = state,  _onChanged = onChanged;

    @override
    State<StatefulWidget> createState()  => TodoSwitchState();

}

class TodoSwitchState extends State<TodoSwitch> {

    late bool _state;

    @override
    void initState() {
        super.initState();
        _state = widget._state;
    }

    @override
    Widget build(BuildContext context) {

        final platform = Theme.of(context).platform;

        void onChanged(bool state) {
            setState(() {
                _state = state;
            });
            widget._onChanged(state);

        }

        return (platform == TargetPlatform.iOS)
            ? CupertinoSwitch(
                value: _state,
                onChanged: onChanged
            )
            : Switch(
                value: _state,
                onChanged: onChanged,
            );
        }
}