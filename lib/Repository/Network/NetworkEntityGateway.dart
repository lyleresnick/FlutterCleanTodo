//  Copyright © 2023 Lyle Resnick. All rights reserved.

import '../Abstraction/EntityGateway.dart';
import '../Abstraction/TodoManager.dart';

import 'RealNetworkClient.dart';
import 'NetworkTodoManager.dart';

class NetworkEntityGateway extends EntityGateway {
    TodoManager get todoManager => NetworkTodoManager(RealNetworkClient());
}
