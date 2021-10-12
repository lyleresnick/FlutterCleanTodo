import 'package:flutter_todo/Entities/Priority.dart';

import 'TestTodo.dart';

class TodoTestData {

  static final data = [
    TestTodo(
        id: "1",
        title: "Get Milk",
        note: "lots",
        priority: Priority.low,
        completed: true),
    TestTodo(
        id: "2",
        title: "Get Going",
        note: "The sdFDS sd fdsfFSD  DSFds\nsdf sdf sd fsd f\nf sdf sd f",
        completeBy: DateTime.parse("2018-12-12"),
        priority: Priority.high,
        completed: false),
    TestTodo(
        id: "3",
        title: "Farm Tools",
        note:
            "hammer, nails, plow\nThis is something else. This is something else2. This is something else3.\nLet's do it again: hammer, nails, plow\nThis is something else. This is something else2. This is something else3.",
        priority: Priority.medium,
        completed: false),
    TestTodo(id: "4", title: "Get Juice", note: "lots", completed: true),
    TestTodo(
        id: "5",
        title: "Charlie Brown",
        note: "Get the album",
        completeBy: DateTime.parse("2019-02-12"),
        priority: Priority.high,
        completed: false),
  ];
}
