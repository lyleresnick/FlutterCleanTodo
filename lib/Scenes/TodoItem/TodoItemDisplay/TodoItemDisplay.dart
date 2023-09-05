//  Copyright © 2023 Lyle Resnick. All rights reserved.

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_todo/Repository/Entities/Priority.dart';
import 'package:flutter_todo/Repository/Entities/Todo.dart';
import '../../AppState/TodoAppState.dart';
import '../../Common/ActionDecoratedScene.dart';
import '../../Common/BlocBuilderData.dart';
import '../../Common/Localize.dart';
import '../../Common/StarterBloc.dart';

part 'Assembly/Assembly.dart';
part 'View/Scene.dart';
part 'Router/Router.dart';
part 'Presenter/Presenter.dart';
part 'Presenter/PresenterOutput.dart';
part 'Presenter/ViewModel.dart';
part 'UseCase/UseCase.dart';
part 'UseCase/UseCaseOutput.dart';
