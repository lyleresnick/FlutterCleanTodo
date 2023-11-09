//  Copyright (c) 2019 Lyle Resnick. All rights reserved.

part of '../TodoItemDisplay.dart';

@visibleForTesting
class Presenter with StarterBloc<_PresenterOutput> {
  final UseCase _useCase;
  final Router _router;
  late List<RowViewModel> _viewModelList;

  Presenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      switch (event) {
        case presentModel(:final modelList):
          _viewModelList = [];
          for (final model in modelList) {
            switch (model) {
              case stringRow(:final field, :final value):
                final fieldName = localizedString(field.name);
                _viewModelList.add(RowViewModel(fieldName, value));
              case boolRow(:final field, :final value):
                final fieldName = localizedString(field.name);
                _viewModelList.add(RowViewModel(
                    fieldName, localizedString(value == true ? "yes" : "no")));
              case priorityRow(:final field, :final value):
                final fieldName = localizedString(field.name);
                _viewModelList
                    .add(RowViewModel(fieldName, localizedString(value.name)));
              case dateRow(:final field, :final value):
                final fieldName = localizedString(field.name);
                _viewModelList
                    .add(RowViewModel(fieldName, localizedDate(value)));
            }
          }
          emit(showFieldList(_viewModelList));
          break;
      }
    });
  }

  void eventModeEdit() {
    _router.routeEditView();
  }

  void eventBack() {
    _router.routeDisplayBack();
  }

  RowViewModel row(int index) {
    return _viewModelList[index];
  }

  int get rowCount {
    return _viewModelList.length;
  }

  String get editLabel => localizedString("edit");

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
