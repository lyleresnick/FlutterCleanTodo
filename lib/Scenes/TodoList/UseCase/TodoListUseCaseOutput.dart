//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoListPresentationModel.dart';

abstract class TodoListUseCaseOutput {}
// ViewReady
class PresentBegin extends TodoListUseCaseOutput {}
class PresentItem extends TodoListUseCaseOutput { final TodoListPresentationModel model; PresentItem(this.model);}
class PresentEnd extends TodoListUseCaseOutput {}
//  Completed
class PresentCompleted extends TodoListUseCaseOutput { final TodoListPresentationModel model; final int index; PresentCompleted(this.model, this.index);}
// Delete
class PresentDeleted extends TodoListUseCaseOutput {final int index; PresentDeleted(this.index);}
class PresentUndoDeleted extends TodoListUseCaseOutput {final int index; PresentUndoDeleted(this.index);}
