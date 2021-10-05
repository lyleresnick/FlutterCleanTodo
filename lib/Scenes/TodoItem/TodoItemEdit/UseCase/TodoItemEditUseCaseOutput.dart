//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoItemEditPresentationModel.dart';

abstract class TodoItemEditUseCaseOutput {}

class PresentModel extends TodoItemEditUseCaseOutput { final TodoItemEditPresentationModel model; PresentModel(this.model); }
class PresentSaveCompleted extends TodoItemEditUseCaseOutput {}
class PresentEditingCancelled extends TodoItemEditUseCaseOutput {}
class PresentCreateCancelled extends TodoItemEditUseCaseOutput {}

