//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPopoverDatePicker {

    DateTime _currentPickerValue;

    void show(DateTime time, BuildContext context, Function(DateTime) onSet, String setLabel) {
        _currentPickerValue = time;
        showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) {
                return _bottomPicker(
                    height: 217.0 + 44,
                    picker: Column(
                        children: <Widget>[
                            Container(
                                height: 44,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  <Widget>[
                                        CupertinoButton(
                                            padding: EdgeInsets.all(0), //fix weird bug
                                            child: Text(setLabel),
                                            onPressed: () {
                                                onSet(_currentPickerValue);
                                                Navigator.of(context).pop();
                                            },
                                        ),
                                    ]
                                ),
                            ),
                            Divider(height: 1,),
                            DefaultTextStyle(
                                style: const TextStyle(
                                    color: CupertinoColors.black,
                                    fontSize: 22.0,
                                ),
                                child: Expanded(
                                    child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        minimumYear: DateTime.now().isBefore(time) ? DateTime.now().year : time.year,
                                        initialDateTime: time,
                                        onDateTimeChanged: (DateTime newDateTime) {
                                             _currentPickerValue = newDateTime;
                                        },
                                    ),
                                ),
                            ),
                        ]
                    ),
                );
            },
        );
    }

    Widget _bottomPicker({double height, Widget picker}) {
        return Container(
            height: height,
            padding: const EdgeInsets.only(top: 6.0),
            color: CupertinoColors.white,
            child: GestureDetector(
                // Blocks taps from propagating to the modal sheet and popping.
                onTap: () {},
                child: SafeArea(
                    top: false,
                    child: picker,
                ),
            ),
        );
    }



}