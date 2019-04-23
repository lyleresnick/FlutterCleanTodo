
import 'Entities/Todo.dart';


class TodoTestData {
    List<Todo> data;

    static get shared =>TodoTestData._private();

    TodoTestData._private() {
        data = _todoDictionary.map( (dictionary) =>
                Todo.fromDictionary(dictionary) ).toList();
    }

    static final List<Map<String, String>> _todoDictionary = [
        {"id": "1", "title": "Get Milk", "note": "lots", "priority": "low", "completed": "true" },
        {"id": "2", "title": "Get Going", "note": "The sdFDS sd fdsfFSD  DSFds\nsdf sdf sd fsd f\nf sdf sd f", "completeBy": "2018-12-12", "priority": "high", "completed": "false" },
        {"id": "3", "title": "Farm Tools", "note": "hammer, nails, plow\nThis is something else. This is something else2. This is something else3.\nLet's do it again: hammer, nails, plow\nThis is something else. This is something else2. This is something else3.", "priority": "medium", "completed": "false" },
        {"id": "4", "title": "Get Juice", "note": "lots", "completed": "true" },
        {"id": "5", "title": "Charlie Brown", "note": "Get the album", "completeBy": "2019-02-12", "priority": "high", "completed": "false" },
    ];
}



