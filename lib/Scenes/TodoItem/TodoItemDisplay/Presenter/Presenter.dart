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
        case presentBegin():
          _viewModelList = [];
        case presentString(:final field, :final value):
          final fieldName = localizedString(field.name);
          _viewModelList.add(RowViewModel(fieldName, value));
        case presentBool(:final field, :final value):
          final fieldName = localizedString(field.name);
          _viewModelList.add(
              RowViewModel(fieldName, localizedString(value ? "yes" : "no")));
        case presentPriority(:final field, :final value):
          final fieldName = localizedString(field.name);
          _viewModelList.add(RowViewModel(
              fieldName, localizedString(value.name)));
        case presentDate(:final field, :final value):
          final fieldName = localizedString(field.name);
          _viewModelList.add(RowViewModel(fieldName, localizedDate(value)));
        case presentEnd():
          emit(showFieldList(_viewModelList));
      }
      ;
    });
  }

  void eventModeEdit() {
    _router.routeEditView();
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
