//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'Localization/TodoLocalizationsDelegate.dart';

String localizeString(String string) => TodoLocalizationsDelegate.localize(string);
String localizeDate(DateTime date) => TodoLocalizationsDelegate.outboundDateFormatter.format(date);

