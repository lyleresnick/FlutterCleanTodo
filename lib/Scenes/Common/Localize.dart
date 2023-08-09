//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'Localization/TodoLocalizationsDelegate.dart';

String localizedString(String string) => TodoLocalizationsDelegate.localize(string);
String localizedDate(DateTime date) => TodoLocalizationsDelegate.outboundDateFormatter.format(date);

