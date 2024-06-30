//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_todo/Scenes/Common/FullScreenLoadingIndicator.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_todo/Repository/Entities/Todo.dart';
import 'package:flutter_todo/Repository/Abstraction/EntityGateway.dart';
import 'package:flutter_todo/Repository/Abstraction/Result.dart';
import '../../AppState/TodoAppState.dart';
import '../../AppState/TodoItemStartMode.dart';
import '../../Common/ActionDecoratedScene.dart';
import '../../Common/BlocBuilder.dart';
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
