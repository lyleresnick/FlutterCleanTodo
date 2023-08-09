//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoOkDialog {
  static show(BuildContext context, String alertTitle, String message) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final platform = Theme.of(context).platform;
      if (platform == TargetPlatform.iOS)
        showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
                    title: Text(alertTitle),
                    content: Text(message),
                    actions: [
                      CupertinoButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ]));
      else
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: Text(alertTitle),
                    content: Text(message),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ]));
    });
  }
}
