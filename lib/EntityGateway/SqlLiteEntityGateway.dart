

import 'package:flutter_todo/EntityGateway/EntityGateway.dart';
import 'package:flutter_todo/Managers/SqlLiteTodoManager.dart';
import 'package:flutter_todo/Managers/TodoManager.dart';
import 'package:flutter_todo/SqlLite/SqlLiteManager.dart';

class SqlLiteEntityGateway extends EntityGateway {
    TodoManager get todoManager => SqlLiteTodoManager(SqlLiteManager());
}
