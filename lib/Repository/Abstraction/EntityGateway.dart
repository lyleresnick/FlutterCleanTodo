//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../Db/SqlLiteEntityGateway.dart';
import '../Ephemeral/EphemeralEntityGateway.dart';
import '../Network/NetworkEntityGateway.dart';
import 'TodoManager.dart';

enum _Implementation {
    test,
    db,
    network
}

abstract class EntityGateway {
    TodoManager get todoManager;

    static final gatewayImplementation = _Implementation.network;

    static EntityGateway get entityGateway {
        switch(gatewayImplementation) {
            case _Implementation.test:
                return EphemeralEntityGateway();
            case _Implementation.db:
                return SqlLiteEntityGateway();
            case _Implementation.network:
                return NetworkEntityGateway();
        }
    }
}