import 'EntityGateway.dart';
import '../Managers/TestTodoManager.dart';

class TestEntityGateway extends EntityGateway {

    get todoManager => TestTodoManager();
}
