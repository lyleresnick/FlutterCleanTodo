//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// high, medium, low or none
class PriorityEnum {
  /// Instantiate a new enum with the provided [value].
  const PriorityEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const high = PriorityEnum._(r'high');
  static const medium = PriorityEnum._(r'medium');
  static const low = PriorityEnum._(r'low');
  static const none = PriorityEnum._(r'none');

  /// List of all possible values in this [enum][PriorityEnum].
  static const values = <PriorityEnum>[
    high,
    medium,
    low,
    none,
  ];

  static PriorityEnum? fromJson(dynamic value) => PriorityEnumTypeTransformer().decode(value);

  static List<PriorityEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PriorityEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PriorityEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PriorityEnum] to String,
/// and [decode] dynamic data back to [PriorityEnum].
class PriorityEnumTypeTransformer {
  factory PriorityEnumTypeTransformer() => _instance ??= const PriorityEnumTypeTransformer._();

  const PriorityEnumTypeTransformer._();

  String encode(PriorityEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PriorityEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PriorityEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'high': return PriorityEnum.high;
        case r'medium': return PriorityEnum.medium;
        case r'low': return PriorityEnum.low;
        case r'none': return PriorityEnum.none;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PriorityEnumTypeTransformer] instance.
  static PriorityEnumTypeTransformer? _instance;
}

