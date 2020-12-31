//  Copyright (c) 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TodoTextField extends StatelessWidget {

    final String value;
    final void Function(String) onChanged;
    final String placeholder;
    final int minLines;
    final int maxLines;
    final _textEditingController = TextEditingController();

    TodoTextField({
        @required this.value,
        @required this.onChanged,
        this.placeholder,
        this.minLines = 1,
        this.maxLines = 1 }) {
        _textEditingController.text = value;
    }

    @override
    Widget build(BuildContext context) {

        final platform = Theme.of(context).platform;

        final onChanged = (value) => this.onChanged(value);
        if(platform == TargetPlatform.iOS) {
            return CupertinoTextField(
                placeholder: placeholder,
                minLines: minLines,
                maxLines: maxLines,
                controller: _textEditingController,
                onChanged: onChanged
            );
        }
        else {
           return TextField(
               decoration: InputDecoration(
                   border: UnderlineInputBorder(),
                   hintText: placeholder
               ),
               minLines: minLines,
               maxLines: maxLines,
               controller: _textEditingController,
               onChanged: onChanged,
           );
        }
    }
}