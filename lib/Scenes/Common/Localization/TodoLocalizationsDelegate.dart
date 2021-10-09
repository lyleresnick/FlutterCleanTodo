import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoLocalizations {
    TodoLocalizations(this.locale);

    final Locale locale;

    static TodoLocalizations? of(BuildContext context) {
        return Localizations.of<TodoLocalizations>(context, TodoLocalizations);
    }

    static Map<String, Map<String, String>> _localizedValues = {
        'en': {
            'enterATitle': 'Enter a Title',
            'title': 'Title',
            'note': 'Note',
            'completeBy': 'Complete By',
            'priority': 'Priority',
            'completed': 'Completed',

            'yes': 'Yes',
            'no': 'No',

            'high': 'High',
            'medium': 'Medium',
            'low': 'Low',
            'none': 'None',

            'save': 'Save',
            'edit': 'Edit',
            'set': 'Set',

            'todo': 'To Do',
            'todoList': 'To Do List',

            'todoNotFound': "Todo with Id: '%@' was not found",
            'titleRequiredTitle': 'Title is Empty',
            'titleRequiredMessage': 'Enter a Title',
        },
        'fr': {
            'enterATitle': 'Entrez un titre',
            'title': 'Titre',
            'note': 'Remarque',
            'completeBy': 'Compléter par',
            'priority': 'Priorité',
            'completed': 'Terminé',

            'yes': 'Oui',
            'no': 'Non',

            'high': 'Haute',
            'medium': 'Moyen',
            'low': 'Faible',
            'none': 'Aucun',

            'save': 'Enregistrer',
            'edit': 'Modifier',
            'set': 'Ensemble',

            'todo': 'Faire',
            'todoList': 'Liste de choses à faire',

            'todoNotFound': "Todo avec Id: '%@' n'a pas été trouvé",
            'titleRequiredTitle': 'Le Titre est Vide',
            'itleRequiredMessage': 'Entrez un Titre',
},
    };

    String localize(String string) {
        final localized = _localizedValues[locale.languageCode]?[string];
        if (localized == null)
            throw Exception("localize: no entry for language code '${locale.languageCode}', key: '$string'");
        return localized;
    }
}

class TodoLocalizationsDelegate extends LocalizationsDelegate<TodoLocalizations> {
    const TodoLocalizationsDelegate();

    static late String _localeString;
    static late TodoLocalizations _todoLocalizations;

    @override
    bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

    @override
    Future<TodoLocalizations> load(Locale locale) async {

        _localeString =  locale.languageCode + "_" + (locale.countryCode ?? 'US');
        _todoLocalizations = TodoLocalizations(locale);
        return SynchronousFuture<TodoLocalizations>(_todoLocalizations);
    }

    @override
    bool shouldReload(TodoLocalizationsDelegate old) => false;

    static DateFormat get outboundDateFormatter => DateFormat.yMMMd(_localeString);
    static String localize(String string) {
        return _todoLocalizations.localize(string);
    }
}