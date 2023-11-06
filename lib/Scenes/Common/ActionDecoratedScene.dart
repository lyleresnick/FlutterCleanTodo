//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/material.dart';

abstract interface class ActionDecoratedScene {
    Widget get title;
    Widget? get leading;
    List<Widget>? get actions;
}


