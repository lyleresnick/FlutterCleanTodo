//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/material.dart';

abstract class ActionDecoratedScene {
    Widget? leading();
    List<Widget>? actions();
    bool get automaticallyImplyLeading;
}


