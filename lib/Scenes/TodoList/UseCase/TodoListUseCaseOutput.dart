//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoListPresentationRowModel.dart';

abstract class TodoListUseCaseOutput {}
class PresentModel extends TodoListUseCaseOutput { final List<TodoListPresentationRowModel> model; PresentModel(this.model);}
class PresentItemDetail extends TodoListUseCaseOutput {}
