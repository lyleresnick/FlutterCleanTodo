import 'EntityGateway.dart';
import '../Managers/TodoManager.dart';
import '../Managers/TestTodoManager.dart';

class TestEntityGateway extends EntityGateway {
    TodoManager get todoManager => TestTodoManager();
}
