import 'EntityGateway.dart';
import '../Managers/SqlLiteTodoManager.dart';
import '../Managers/TodoManager.dart';
import '../SqlLite/SqlLiteManager.dart';

class SqlLiteEntityGateway extends EntityGateway {
    TodoManager get todoManager => SqlLiteTodoManager(SqlLiteManager());
}
