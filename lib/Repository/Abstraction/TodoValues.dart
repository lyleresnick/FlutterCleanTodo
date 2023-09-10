//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../Entities/Priority.dart';

typedef TodoValues = ({
  String title,
  String note,
  DateTime? completeBy,
  Priority priority,
  bool completed,
});