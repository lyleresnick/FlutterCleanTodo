import 'SqlLiteEntityGateway.dart';
import 'TestEntityGateway.dart';
import '../Managers/TodoManager.dart';

enum _Implementation {
    test,
    db
}

abstract class EntityGateway {
    TodoManager get todoManager;

    static final gatewayImplementation = _Implementation.db;

    static EntityGateway get entityGateway {
        switch(gatewayImplementation) {
        case _Implementation.test:
            return TestEntityGateway();
        case _Implementation.db:
            return SqlLiteEntityGateway();
        }
    }
}