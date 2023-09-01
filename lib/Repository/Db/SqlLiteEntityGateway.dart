//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../Abstraction/EntityGateway.dart';
import '../Abstraction/TodoManager.dart';
import '../Db/SqlLiteTodoManager.dart';
import '../Db/SqlLiteManager.dart';

class SqlLiteEntityGateway extends EntityGateway {
    TodoManager get todoManager => SqlLiteTodoManager(SqlLiteManager());
}
