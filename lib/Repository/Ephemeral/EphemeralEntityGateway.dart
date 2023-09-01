//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../Abstraction/EntityGateway.dart';
import '../Abstraction/TodoManager.dart';
import 'EphemeralTodoManager.dart';

class EphemeralEntityGateway extends EntityGateway {
    TodoManager get todoManager => EphemeralTodoManager();
}
