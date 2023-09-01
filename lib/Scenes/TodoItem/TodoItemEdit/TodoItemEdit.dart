//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_todo/Repository/Entities/Priority.dart';
import 'package:flutter_todo/Repository/Entities/Todo.dart';
import 'package:flutter_todo/Repository/Abstraction/EntityGateway.dart';
import 'package:flutter_todo/Repository/Abstraction/Result.dart';
import 'package:flutter_todo/Repository/Abstraction/TodoValues.dart';
import '../../AppState/AppState.dart';
import '../../AppState/TodoAppState.dart';
import '../../AppState/TodoItemStartMode.dart';
import '../../Common/ActionDecoratedScene.dart';
import '../../Common/BlocProvider.dart';
import '../../Common/CupertinoPopoverDatePicker.dart';
import '../../Common/ErrorMessages.dart';
import '../../Common/Localize.dart';
import '../../Common/StarterBloc.dart';
import '../../Common/TodoExclusive.dart';
import '../../Common/TodoOkDialog.dart';
import '../../Common/TodoSwitch.dart';
import '../../Common/TodoTextField.dart';

part 'Assembly/Assembly.dart';
part 'View/Scene.dart';
part 'Router/Router.dart';
part 'Presenter/Presenter.dart';
part 'Presenter/PresenterOutput.dart';
part 'Presenter/ViewModel.dart';
part 'UseCase/UseCase.dart';
part 'UseCase/CreateUseCase.dart';
part 'UseCase/UpdateUseCase.dart';
part 'UseCase/UseCaseOutput.dart';
part 'UseCase/PresentationModel.dart';

