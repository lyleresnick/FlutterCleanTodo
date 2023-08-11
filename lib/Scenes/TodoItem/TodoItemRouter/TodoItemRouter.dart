import 'package:flutter/material.dart';

import 'package:flutter_todo/Repository/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Repository/Managers/Result.dart';
import '../../AppState/TodoAppState.dart';
import '../../AppState/TodoItemStartMode.dart';
import '../../AppState/TodoItemState.dart';
import '../../Common/ActionDecoratedScene.dart';
import '../../Common/BlocProvider.dart';
import '../../Common/Localize.dart';
import '../../Common/StarterBloc.dart';
import '../TodoItemDisplay/TodoItemDisplay.dart' as TodoItemDisplay;
import '../TodoItemEdit/TodoItemEdit.dart' as TodoItemEdit;

part 'Assembly/Assembly.dart';
part 'View/Scene.dart';
part 'Router/Router.dart';
part 'Presenter/Presenter.dart';
part 'Presenter/PresenterOutput.dart';
part 'UseCase/UseCase.dart';
part 'UseCase/UseCaseOutput.dart';
