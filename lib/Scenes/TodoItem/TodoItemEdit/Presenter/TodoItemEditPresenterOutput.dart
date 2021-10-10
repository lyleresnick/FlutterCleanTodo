//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import 'TodoItemEditViewModel.dart';

abstract class TodoItemEditPresenterOutput {}
class ShowModel extends TodoItemEditPresenterOutput { final TodoItemEditViewModel model; ShowModel(this.model); }
