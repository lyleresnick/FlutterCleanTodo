//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_todo/Scenes/TodoRootRouter/TodoRootRouter.dart' as TodoRootRouter;
import 'Scenes/Common/Localization/TodoLocalizationsDelegate.dart';
import 'Scenes/Common/Localization/FrenchCupertinoLocalizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo of Todo using Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoRootRouter.Assembly().scene,
      localizationsDelegates: [
        const TodoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FrenchCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('fr'), // French
      ],
    );
  }
}
