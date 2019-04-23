import 'TestEntityGateway.dart';
import '../Managers/TodoManager.dart';

enum _Implementation {
    test,
    coreData
}

abstract class EntityGateway {
    TodoManager get todoManager;

    static final gatewayImplementation = _Implementation.test;

    static get entityGateway {
        switch(gatewayImplementation) {
        case _Implementation.test:
            return TestEntityGateway();
        case _Implementation.coreData:
            return null;
        }
        return null;
    }
}