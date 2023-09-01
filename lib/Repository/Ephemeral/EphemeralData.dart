//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../Entities/Priority.dart';
import 'EphemeralTodo.dart';

class TodoEphemeralData {

  static final data = [
    EphemeralTodo(
        id: "1",
        title: "Get Milk",
        note: "lots",
        priority: Priority.low,
        completed: true),
    EphemeralTodo(
        id: "2",
        title: "Get Going",
        note: "The sdFDS sd fdsfFSD  DSFds\nsdf sdf sd fsd f\nf sdf sd f",
        completeBy: DateTime.parse("2018-12-12"),
        priority: Priority.high,
        completed: false),
    EphemeralTodo(
        id: "3",
        title: "Farm Tools",
        note:
            "hammer, nails, plow\nThis is something else. This is something else2. This is something else3.\nLet's do it again: hammer, nails, plow\nThis is something else. This is something else2. This is something else3.",
        priority: Priority.medium,
        completed: false),
    EphemeralTodo(id: "4", title: "Get Juice", note: "lots", completed: true),
    EphemeralTodo(
        id: "5",
        title: "Charlie Brown",
        note: "Get the album",
        completeBy: DateTime.parse("2019-02-12"),
        priority: Priority.high,
        completed: false),
  ];
}
