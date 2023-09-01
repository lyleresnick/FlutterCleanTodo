//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TodoResponse {
  /// Returns a new [TodoResponse] instance.
  TodoResponse({
    required this.id,
    required this.title,
    this.note,
    required this.priority,
    this.completeBy,
    required this.completed,
  });

  String id;

  String title;

  /// multiline note
  String? note;

  PriorityEnum priority;

  /// todo must be completed by this date
  DateTime? completeBy;

  /// todo is completed
  bool completed;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TodoResponse &&
    other.id == id &&
    other.title == title &&
    other.note == note &&
    other.priority == priority &&
    other.completeBy == completeBy &&
    other.completed == completed;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (title.hashCode) +
    (note == null ? 0 : note!.hashCode) +
    (priority.hashCode) +
    (completeBy == null ? 0 : completeBy!.hashCode) +
    (completed.hashCode);

  @override
  String toString() => 'TodoResponse[id=$id, title=$title, note=$note, priority=$priority, completeBy=$completeBy, completed=$completed]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'title'] = this.title;
    if (this.note != null) {
      json[r'note'] = this.note;
    } else {
      json[r'note'] = null;
    }
      json[r'priority'] = this.priority;
    if (this.completeBy != null) {
      json[r'completeBy'] = _dateFormatter.format(this.completeBy!.toUtc());
    } else {
      json[r'completeBy'] = null;
    }
      json[r'completed'] = this.completed;
    return json;
  }

  /// Returns a new [TodoResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TodoResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TodoResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TodoResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TodoResponse(
        id: mapValueOfType<String>(json, r'id')!,
        title: mapValueOfType<String>(json, r'title')!,
        note: mapValueOfType<String>(json, r'note'),
        priority: PriorityEnum.fromJson(json[r'priority'])!,
        completeBy: mapDateTime(json, r'completeBy', r''),
        completed: mapValueOfType<bool>(json, r'completed')!,
      );
    }
    return null;
  }

  static List<TodoResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TodoResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TodoResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TodoResponse> mapFromJson(dynamic json) {
    final map = <String, TodoResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TodoResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TodoResponse-objects as value to a dart map
  static Map<String, List<TodoResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TodoResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TodoResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'title',
    'priority',
    'completed',
  };
}

