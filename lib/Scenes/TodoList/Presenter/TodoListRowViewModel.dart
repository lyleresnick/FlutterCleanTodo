//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../UseCase/TodoListPresentationModel.dart';
import 'package:intl/intl.dart';

class TodoListRowViewModel {

    final String id;
    final String title;
    final String completeBy;
    final String priority;
    final bool completed;

    TodoListRowViewModel(TodoListPresentationModel model) :
        id = model.id,
        title = model.title,
        completeBy = (model.completeBy != null) ? _outboundDateFormatter.format(model.completeBy) : "",
        priority = List<String>.generate(model.priority + 1, (index) => " " ).reduce((value, element) => "!$value" ),
        completed = model.completed ;

    static final _outboundDateFormatter = DateFormat( "MMM' 'dd', 'yyyy" );
}
