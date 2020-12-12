//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

import '../Presenter/TodoListRowViewModel.dart';

abstract class TodoListPresenterOutput {}
    // ViewReady
class ShowTodoList extends TodoListPresenterOutput { final List<TodoListRowViewModel> viewModelList; ShowTodoList(this.viewModelList); }
    // Create
class ShowAdded extends TodoListPresenterOutput { final List<TodoListRowViewModel> viewModelList; int index; ShowAdded(this.viewModelList, this.index); }
    // Delete
class ShowUndoDeleted extends TodoListPresenterOutput { final List<TodoListRowViewModel> viewModelList; int index; ShowUndoDeleted(this.viewModelList, this.index); }
class ShowDeleted extends TodoListPresenterOutput { final List<TodoListRowViewModel> viewModelList; int index; ShowDeleted(this.viewModelList, this.index); }
    // Changed
class ShowChanged extends TodoListPresenterOutput { final List<TodoListRowViewModel> viewModelList; int index; ShowChanged(this.viewModelList, this.index); }
    // Completed
class ShowCompleted extends TodoListPresenterOutput { final List<TodoListRowViewModel> viewModelList; int index; ShowCompleted(this.viewModelList, this.index); }

