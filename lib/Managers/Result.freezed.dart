// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

  _Success<Entity, Issue> success<Entity, Issue>(Entity data) {
    return _Success<Entity, Issue>(
      data,
    );
  }

  _Failure<Entity, Issue> failure<Entity, Issue>(int code, String description) {
    return _Failure<Entity, Issue>(
      code,
      description,
    );
  }

  _DomainIssue<Entity, Issue> domainIssue<Entity, Issue>(Issue reason) {
    return _DomainIssue<Entity, Issue>(
      reason,
    );
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<Entity, Issue> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Entity data) success,
    required TResult Function(int code, String description) failure,
    required TResult Function(Issue reason) domainIssue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Entity data)? success,
    TResult Function(int code, String description)? failure,
    TResult Function(Issue reason)? domainIssue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Entity data)? success,
    TResult Function(int code, String description)? failure,
    TResult Function(Issue reason)? domainIssue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<Entity, Issue> value) success,
    required TResult Function(_Failure<Entity, Issue> value) failure,
    required TResult Function(_DomainIssue<Entity, Issue> value) domainIssue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<Entity, Issue> value)? success,
    TResult Function(_Failure<Entity, Issue> value)? failure,
    TResult Function(_DomainIssue<Entity, Issue> value)? domainIssue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<Entity, Issue> value)? success,
    TResult Function(_Failure<Entity, Issue> value)? failure,
    TResult Function(_DomainIssue<Entity, Issue> value)? domainIssue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<Entity, Issue, $Res> {
  factory $ResultCopyWith(Result<Entity, Issue> value,
          $Res Function(Result<Entity, Issue>) then) =
      _$ResultCopyWithImpl<Entity, Issue, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<Entity, Issue, $Res>
    implements $ResultCopyWith<Entity, Issue, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<Entity, Issue> _value;
  // ignore: unused_field
  final $Res Function(Result<Entity, Issue>) _then;
}

/// @nodoc
abstract class _$SuccessCopyWith<Entity, Issue, $Res> {
  factory _$SuccessCopyWith(_Success<Entity, Issue> value,
          $Res Function(_Success<Entity, Issue>) then) =
      __$SuccessCopyWithImpl<Entity, Issue, $Res>;
  $Res call({Entity data});
}

/// @nodoc
class __$SuccessCopyWithImpl<Entity, Issue, $Res>
    extends _$ResultCopyWithImpl<Entity, Issue, $Res>
    implements _$SuccessCopyWith<Entity, Issue, $Res> {
  __$SuccessCopyWithImpl(_Success<Entity, Issue> _value,
      $Res Function(_Success<Entity, Issue>) _then)
      : super(_value, (v) => _then(v as _Success<Entity, Issue>));

  @override
  _Success<Entity, Issue> get _value => super._value as _Success<Entity, Issue>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_Success<Entity, Issue>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Entity,
    ));
  }
}

/// @nodoc

class _$_Success<Entity, Issue> implements _Success<Entity, Issue> {
  const _$_Success(this.data);

  @override
  final Entity data;

  @override
  String toString() {
    return 'Result<$Entity, $Issue>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success<Entity, Issue> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<Entity, Issue, _Success<Entity, Issue>> get copyWith =>
      __$SuccessCopyWithImpl<Entity, Issue, _Success<Entity, Issue>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Entity data) success,
    required TResult Function(int code, String description) failure,
    required TResult Function(Issue reason) domainIssue,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Entity data)? success,
    TResult Function(int code, String description)? failure,
    TResult Function(Issue reason)? domainIssue,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Entity data)? success,
    TResult Function(int code, String description)? failure,
    TResult Function(Issue reason)? domainIssue,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<Entity, Issue> value) success,
    required TResult Function(_Failure<Entity, Issue> value) failure,
    required TResult Function(_DomainIssue<Entity, Issue> value) domainIssue,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<Entity, Issue> value)? success,
    TResult Function(_Failure<Entity, Issue> value)? failure,
    TResult Function(_DomainIssue<Entity, Issue> value)? domainIssue,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<Entity, Issue> value)? success,
    TResult Function(_Failure<Entity, Issue> value)? failure,
    TResult Function(_DomainIssue<Entity, Issue> value)? domainIssue,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<Entity, Issue> implements Result<Entity, Issue> {
  const factory _Success(Entity data) = _$_Success<Entity, Issue>;

  Entity get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<Entity, Issue, _Success<Entity, Issue>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureCopyWith<Entity, Issue, $Res> {
  factory _$FailureCopyWith(_Failure<Entity, Issue> value,
          $Res Function(_Failure<Entity, Issue>) then) =
      __$FailureCopyWithImpl<Entity, Issue, $Res>;
  $Res call({int code, String description});
}

/// @nodoc
class __$FailureCopyWithImpl<Entity, Issue, $Res>
    extends _$ResultCopyWithImpl<Entity, Issue, $Res>
    implements _$FailureCopyWith<Entity, Issue, $Res> {
  __$FailureCopyWithImpl(_Failure<Entity, Issue> _value,
      $Res Function(_Failure<Entity, Issue>) _then)
      : super(_value, (v) => _then(v as _Failure<Entity, Issue>));

  @override
  _Failure<Entity, Issue> get _value => super._value as _Failure<Entity, Issue>;

  @override
  $Res call({
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_Failure<Entity, Issue>(
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure<Entity, Issue> implements _Failure<Entity, Issue> {
  const _$_Failure(this.code, this.description);

  @override
  final int code;
  @override
  final String description;

  @override
  String toString() {
    return 'Result<$Entity, $Issue>.failure(code: $code, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failure<Entity, Issue> &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<Entity, Issue, _Failure<Entity, Issue>> get copyWith =>
      __$FailureCopyWithImpl<Entity, Issue, _Failure<Entity, Issue>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Entity data) success,
    required TResult Function(int code, String description) failure,
    required TResult Function(Issue reason) domainIssue,
  }) {
    return failure(code, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Entity data)? success,
    TResult Function(int code, String description)? failure,
    TResult Function(Issue reason)? domainIssue,
  }) {
    return failure?.call(code, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Entity data)? success,
    TResult Function(int code, String description)? failure,
    TResult Function(Issue reason)? domainIssue,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(code, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<Entity, Issue> value) success,
    required TResult Function(_Failure<Entity, Issue> value) failure,
    required TResult Function(_DomainIssue<Entity, Issue> value) domainIssue,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<Entity, Issue> value)? success,
    TResult Function(_Failure<Entity, Issue> value)? failure,
    TResult Function(_DomainIssue<Entity, Issue> value)? domainIssue,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<Entity, Issue> value)? success,
    TResult Function(_Failure<Entity, Issue> value)? failure,
    TResult Function(_DomainIssue<Entity, Issue> value)? domainIssue,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure<Entity, Issue> implements Result<Entity, Issue> {
  const factory _Failure(int code, String description) =
      _$_Failure<Entity, Issue>;

  int get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FailureCopyWith<Entity, Issue, _Failure<Entity, Issue>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DomainIssueCopyWith<Entity, Issue, $Res> {
  factory _$DomainIssueCopyWith(_DomainIssue<Entity, Issue> value,
          $Res Function(_DomainIssue<Entity, Issue>) then) =
      __$DomainIssueCopyWithImpl<Entity, Issue, $Res>;
  $Res call({Issue reason});
}

/// @nodoc
class __$DomainIssueCopyWithImpl<Entity, Issue, $Res>
    extends _$ResultCopyWithImpl<Entity, Issue, $Res>
    implements _$DomainIssueCopyWith<Entity, Issue, $Res> {
  __$DomainIssueCopyWithImpl(_DomainIssue<Entity, Issue> _value,
      $Res Function(_DomainIssue<Entity, Issue>) _then)
      : super(_value, (v) => _then(v as _DomainIssue<Entity, Issue>));

  @override
  _DomainIssue<Entity, Issue> get _value =>
      super._value as _DomainIssue<Entity, Issue>;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_DomainIssue<Entity, Issue>(
      reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Issue,
    ));
  }
}

/// @nodoc

class _$_DomainIssue<Entity, Issue> implements _DomainIssue<Entity, Issue> {
  const _$_DomainIssue(this.reason);

  @override
  final Issue reason;

  @override
  String toString() {
    return 'Result<$Entity, $Issue>.domainIssue(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DomainIssue<Entity, Issue> &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reason);

  @JsonKey(ignore: true)
  @override
  _$DomainIssueCopyWith<Entity, Issue, _DomainIssue<Entity, Issue>>
      get copyWith => __$DomainIssueCopyWithImpl<Entity, Issue,
          _DomainIssue<Entity, Issue>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Entity data) success,
    required TResult Function(int code, String description) failure,
    required TResult Function(Issue reason) domainIssue,
  }) {
    return domainIssue(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Entity data)? success,
    TResult Function(int code, String description)? failure,
    TResult Function(Issue reason)? domainIssue,
  }) {
    return domainIssue?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Entity data)? success,
    TResult Function(int code, String description)? failure,
    TResult Function(Issue reason)? domainIssue,
    required TResult orElse(),
  }) {
    if (domainIssue != null) {
      return domainIssue(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<Entity, Issue> value) success,
    required TResult Function(_Failure<Entity, Issue> value) failure,
    required TResult Function(_DomainIssue<Entity, Issue> value) domainIssue,
  }) {
    return domainIssue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<Entity, Issue> value)? success,
    TResult Function(_Failure<Entity, Issue> value)? failure,
    TResult Function(_DomainIssue<Entity, Issue> value)? domainIssue,
  }) {
    return domainIssue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<Entity, Issue> value)? success,
    TResult Function(_Failure<Entity, Issue> value)? failure,
    TResult Function(_DomainIssue<Entity, Issue> value)? domainIssue,
    required TResult orElse(),
  }) {
    if (domainIssue != null) {
      return domainIssue(this);
    }
    return orElse();
  }
}

abstract class _DomainIssue<Entity, Issue> implements Result<Entity, Issue> {
  const factory _DomainIssue(Issue reason) = _$_DomainIssue<Entity, Issue>;

  Issue get reason => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$DomainIssueCopyWith<Entity, Issue, _DomainIssue<Entity, Issue>>
      get copyWith => throw _privateConstructorUsedError;
}
