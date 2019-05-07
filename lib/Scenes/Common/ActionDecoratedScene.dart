//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/material.dart';

abstract class ActionDecoratedScene {
    Widget leading(TargetPlatform platform);
    List<Widget> actions(TargetPlatform platform);
    bool get automaticallyImplyLeading;
}


