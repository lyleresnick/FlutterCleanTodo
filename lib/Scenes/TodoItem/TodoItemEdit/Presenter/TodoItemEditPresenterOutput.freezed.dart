// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'TodoItemEditPresenterOutput.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoItemEditPresenterOutputTearOff {
  const _$TodoItemEditPresenterOutputTearOff();

  _ShowModel showModel(TodoItemEditViewModel model) {
    return _ShowModel(
      model,
    );
  }
}

/// @nodoc
const $TodoItemEditPresenterOutput = _$TodoItemEditPresenterOutputTearOff();

/// @nodoc
mixin _$TodoItemEditPresenterOutput {
  TodoItemEditViewModel get model => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemEditViewModel model) showModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TodoItemEditViewModel model)? showModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemEditViewModel model)? showModel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowModel value) showModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ShowModel value)? showModel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowModel value)? showModel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoItemEditPresenterOutputCopyWith<TodoItemEditPresenterOutput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemEditPresenterOutputCopyWith<$Res> {
  factory $TodoItemEditPresenterOutputCopyWith(
          TodoItemEditPresenterOutput value,
          $Res Function(TodoItemEditPresenterOutput) then) =
      _$TodoItemEditPresenterOutputCopyWithImpl<$Res>;
  $Res call({TodoItemEditViewModel model});
}

/// @nodoc
class _$TodoItemEditPresenterOutputCopyWithImpl<$Res>
    implements $TodoItemEditPresenterOutputCopyWith<$Res> {
  _$TodoItemEditPresenterOutputCopyWithImpl(this._value, this._then);

  final TodoItemEditPresenterOutput _value;
  // ignore: unused_field
  final $Res Function(TodoItemEditPresenterOutput) _then;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TodoItemEditViewModel,
    ));
  }
}

/// @nodoc
abstract class _$ShowModelCopyWith<$Res>
    implements $TodoItemEditPresenterOutputCopyWith<$Res> {
  factory _$ShowModelCopyWith(
          _ShowModel value, $Res Function(_ShowModel) then) =
      __$ShowModelCopyWithImpl<$Res>;
  @override
  $Res call({TodoItemEditViewModel model});
}

/// @nodoc
class __$ShowModelCopyWithImpl<$Res>
    extends _$TodoItemEditPresenterOutputCopyWithImpl<$Res>
    implements _$ShowModelCopyWith<$Res> {
  __$ShowModelCopyWithImpl(_ShowModel _value, $Res Function(_ShowModel) _then)
      : super(_value, (v) => _then(v as _ShowModel));

  @override
  _ShowModel get _value => super._value as _ShowModel;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_ShowModel(
      model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TodoItemEditViewModel,
    ));
  }
}

/// @nodoc

class _$_ShowModel implements _ShowModel {
  const _$_ShowModel(this.model);

  @override
  final TodoItemEditViewModel model;

  @override
  String toString() {
    return 'TodoItemEditPresenterOutput.showModel(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowModel &&
            (identical(other.model, model) ||
                const DeepCollectionEquality().equals(other.model, model)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(model);

  @JsonKey(ignore: true)
  @override
  _$ShowModelCopyWith<_ShowModel> get copyWith =>
      __$ShowModelCopyWithImpl<_ShowModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemEditViewModel model) showModel,
  }) {
    return showModel(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TodoItemEditViewModel model)? showModel,
  }) {
    return showModel?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemEditViewModel model)? showModel,
    required TResult orElse(),
  }) {
    if (showModel != null) {
      return showModel(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowModel value) showModel,
  }) {
    return showModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ShowModel value)? showModel,
  }) {
    return showModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowModel value)? showModel,
    required TResult orElse(),
  }) {
    if (showModel != null) {
      return showModel(this);
    }
    return orElse();
  }
}

abstract class _ShowModel implements TodoItemEditPresenterOutput {
  const factory _ShowModel(TodoItemEditViewModel model) = _$_ShowModel;

  @override
  TodoItemEditViewModel get model => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShowModelCopyWith<_ShowModel> get copyWith =>
      throw _privateConstructorUsedError;
}
