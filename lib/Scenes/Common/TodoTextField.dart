//  Copyright (c) 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TodoTextField extends StatefulWidget {

    final String value;
    final void Function(String) onChanged;
    final String placeholder;
    final int minLines;
    final int maxLines;

    TodoTextField({
        @required this.value,
        @required this.onChanged,
        this.placeholder,
        this.minLines = 1,
        this.maxLines = 1
    });

    @override
    State<StatefulWidget> createState()  => TodoTextFieldState();
}

class TodoTextFieldState extends State<TodoTextField> {

    String _value;
    final _textEditingController = TextEditingController();

    @override
    void initState() {
        super.initState();
        _value = widget.value;
        _textEditingController.text = _value;
    }

    @override
    Widget build(BuildContext context) {

        final platform = Theme.of(context).platform;

        void onChanged(value) {
            setState(() {
                _value = value;
            });
            widget.onChanged(value);
        }

        if(platform == TargetPlatform.iOS) {
            return CupertinoTextField(
                placeholder: widget.placeholder,
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                controller: _textEditingController,
                onChanged: onChanged,
            );
        }
        else {
           return TextField(
               decoration: InputDecoration(
                   border: UnderlineInputBorder(),
                   hintText: widget.placeholder
               ),
               minLines: widget.minLines,
               maxLines: widget.maxLines,
               controller: _textEditingController,
               onChanged: onChanged,
           );
        }
    }
}