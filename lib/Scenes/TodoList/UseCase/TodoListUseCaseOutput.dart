//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoListPresentationRowModel.dart';

abstract class TodoListUseCaseOutput {}
// ViewReady
class PresentModel extends TodoListUseCaseOutput { final List<TodoListPresentationRowModel> model; PresentModel(this.model);}
//  Completed
class PresentCompleted extends TodoListUseCaseOutput { final TodoListPresentationRowModel model; final int index; PresentCompleted(this.model, this.index);}
// Delete
class PresentDeleted extends TodoListUseCaseOutput {final int index; PresentDeleted(this.index);}
class PresentUndoDeleted extends TodoListUseCaseOutput {final int index; PresentUndoDeleted(this.index);}
class PresentItemDetail extends TodoListUseCaseOutput {}
