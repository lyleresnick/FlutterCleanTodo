import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';


class _CupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
    const _CupertinoLocalizationsDelegate();

    @override
    bool isSupported(Locale locale) => locale.languageCode == 'fr';

    @override
    Future<CupertinoLocalizations> load(Locale locale) => FrenchCupertinoLocalizations.load(locale);

    @override
    bool shouldReload(_CupertinoLocalizationsDelegate old) => false;

    @override
    String toString() => 'DefaultCupertinoLocalizations.delegate(fr_FR)';
}

class FrenchCupertinoLocalizations implements CupertinoLocalizations {
    const FrenchCupertinoLocalizations();

    static const List<String> _shortWeekdays = <String>[
        'lun',
        'mar',
        'mer',
        'jeu',
        'ven',
        'sam',
        'dim',
    ];

    static const List<String> _shortMonths = <String>[
        'janv.',
        'févr.',
        'mars',
        'avril',
        'mai',
        'juin',
        'juil.',
        'août',
        'sept.',
        'oct.',
        'nov.',
        'déc.',
    ];

    static const List<String> _months = <String>[
        'janvier',
        'février',
        'mars',
        'avril',
        'mai',
        'juin',
        'juillet',
        'aout',
        'septembre',
        'octobre',
        'novembre',
        'décembre',
    ];



    @override
    String datePickerYear(int yearIndex) => yearIndex.toString();

    @override
    String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

    @override
    String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

    @override
    String datePickerHour(int hour) => hour.toString();

    @override
    String datePickerHourSemanticsLabel(int hour) => hour.toString() + " regarder";

    @override
    String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

    @override
    String datePickerMinuteSemanticsLabel(int minute) {
        if (minute == 1)
            return '1 Minute';
        return minute.toString() + ' procès-verbal';
    }

    @override
    String datePickerMediumDate(DateTime date) {
        return '${_shortWeekdays[date.weekday - DateTime.monday]} '
                '${_shortMonths[date.month - DateTime.january]} '
                '${date.day.toString().padRight(2)}';
    }

    @override
    DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

    @override
    DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_time_dayPeriod;

    @override
    String get anteMeridiemAbbreviation => 'AM';

    @override
    String get postMeridiemAbbreviation => 'PM';

    @override
    String get alertDialogLabel => "d'info";

    @override
    String timerPickerHour(int hour) => hour.toString();

    @override
    String timerPickerMinute(int minute) => minute.toString();

    @override
    String timerPickerSecond(int second) => second.toString();

    @override
    String timerPickerHourLabel(int hour) => hour == 1 ? 'heure' : 'heures';

    @override
    String timerPickerMinuteLabel(int minute) => 'min';

    @override
    String timerPickerSecondLabel(int second) => 'seconde';

    @override
    String get cutButtonLabel => 'Découper';

    @override
    String get copyButtonLabel => 'Dopie';

    @override
    String get pasteButtonLabel => 'Dnsérer';

    @override
    String get selectAllButtonLabel => 'Tout sélectionner';

    static Future<CupertinoLocalizations> load(Locale locale) {
        return SynchronousFuture<CupertinoLocalizations>(const FrenchCupertinoLocalizations());
    }

    static const LocalizationsDelegate<CupertinoLocalizations> delegate = _CupertinoLocalizationsDelegate();

  @override
  String get todayLabel => "Aujourd'hui";
}