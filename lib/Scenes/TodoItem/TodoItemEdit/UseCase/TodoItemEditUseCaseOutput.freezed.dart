// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'TodoItemEditUseCaseOutput.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoItemEditUseCaseOutputTearOff {
  const _$TodoItemEditUseCaseOutputTearOff();

  _PresentModel presentModel(TodoItemEditPresentationModel model) {
    return _PresentModel(
      model,
    );
  }

  _PresentSaveCompleted presentSaveCompleted() {
    return const _PresentSaveCompleted();
  }

  _PresentEditingCancelled presentEditingCancelled() {
    return const _PresentEditingCancelled();
  }

  _PresentCreateCancelled presentCreateCancelled() {
    return const _PresentCreateCancelled();
  }
}

/// @nodoc
const $TodoItemEditUseCaseOutput = _$TodoItemEditUseCaseOutputTearOff();

/// @nodoc
mixin _$TodoItemEditUseCaseOutput {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemEditPresentationModel model) presentModel,
    required TResult Function() presentSaveCompleted,
    required TResult Function() presentEditingCancelled,
    required TResult Function() presentCreateCancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentModel value) presentModel,
    required TResult Function(_PresentSaveCompleted value) presentSaveCompleted,
    required TResult Function(_PresentEditingCancelled value)
        presentEditingCancelled,
    required TResult Function(_PresentCreateCancelled value)
        presentCreateCancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemEditUseCaseOutputCopyWith<$Res> {
  factory $TodoItemEditUseCaseOutputCopyWith(TodoItemEditUseCaseOutput value,
          $Res Function(TodoItemEditUseCaseOutput) then) =
      _$TodoItemEditUseCaseOutputCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoItemEditUseCaseOutputCopyWithImpl<$Res>
    implements $TodoItemEditUseCaseOutputCopyWith<$Res> {
  _$TodoItemEditUseCaseOutputCopyWithImpl(this._value, this._then);

  final TodoItemEditUseCaseOutput _value;
  // ignore: unused_field
  final $Res Function(TodoItemEditUseCaseOutput) _then;
}

/// @nodoc
abstract class _$PresentModelCopyWith<$Res> {
  factory _$PresentModelCopyWith(
          _PresentModel value, $Res Function(_PresentModel) then) =
      __$PresentModelCopyWithImpl<$Res>;
  $Res call({TodoItemEditPresentationModel model});
}

/// @nodoc
class __$PresentModelCopyWithImpl<$Res>
    extends _$TodoItemEditUseCaseOutputCopyWithImpl<$Res>
    implements _$PresentModelCopyWith<$Res> {
  __$PresentModelCopyWithImpl(
      _PresentModel _value, $Res Function(_PresentModel) _then)
      : super(_value, (v) => _then(v as _PresentModel));

  @override
  _PresentModel get _value => super._value as _PresentModel;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_PresentModel(
      model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as TodoItemEditPresentationModel,
    ));
  }
}

/// @nodoc

class _$_PresentModel implements _PresentModel {
  const _$_PresentModel(this.model);

  @override
  final TodoItemEditPresentationModel model;

  @override
  String toString() {
    return 'TodoItemEditUseCaseOutput.presentModel(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PresentModel &&
            (identical(other.model, model) ||
                const DeepCollectionEquality().equals(other.model, model)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(model);

  @JsonKey(ignore: true)
  @override
  _$PresentModelCopyWith<_PresentModel> get copyWith =>
      __$PresentModelCopyWithImpl<_PresentModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemEditPresentationModel model) presentModel,
    required TResult Function() presentSaveCompleted,
    required TResult Function() presentEditingCancelled,
    required TResult Function() presentCreateCancelled,
  }) {
    return presentModel(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
  }) {
    return presentModel?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
    required TResult orElse(),
  }) {
    if (presentModel != null) {
      return presentModel(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentModel value) presentModel,
    required TResult Function(_PresentSaveCompleted value) presentSaveCompleted,
    required TResult Function(_PresentEditingCancelled value)
        presentEditingCancelled,
    required TResult Function(_PresentCreateCancelled value)
        presentCreateCancelled,
  }) {
    return presentModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
  }) {
    return presentModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
    required TResult orElse(),
  }) {
    if (presentModel != null) {
      return presentModel(this);
    }
    return orElse();
  }
}

abstract class _PresentModel implements TodoItemEditUseCaseOutput {
  const factory _PresentModel(TodoItemEditPresentationModel model) =
      _$_PresentModel;

  TodoItemEditPresentationModel get model => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PresentModelCopyWith<_PresentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PresentSaveCompletedCopyWith<$Res> {
  factory _$PresentSaveCompletedCopyWith(_PresentSaveCompleted value,
          $Res Function(_PresentSaveCompleted) then) =
      __$PresentSaveCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$PresentSaveCompletedCopyWithImpl<$Res>
    extends _$TodoItemEditUseCaseOutputCopyWithImpl<$Res>
    implements _$PresentSaveCompletedCopyWith<$Res> {
  __$PresentSaveCompletedCopyWithImpl(
      _PresentSaveCompleted _value, $Res Function(_PresentSaveCompleted) _then)
      : super(_value, (v) => _then(v as _PresentSaveCompleted));

  @override
  _PresentSaveCompleted get _value => super._value as _PresentSaveCompleted;
}

/// @nodoc

class _$_PresentSaveCompleted implements _PresentSaveCompleted {
  const _$_PresentSaveCompleted();

  @override
  String toString() {
    return 'TodoItemEditUseCaseOutput.presentSaveCompleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PresentSaveCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemEditPresentationModel model) presentModel,
    required TResult Function() presentSaveCompleted,
    required TResult Function() presentEditingCancelled,
    required TResult Function() presentCreateCancelled,
  }) {
    return presentSaveCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
  }) {
    return presentSaveCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
    required TResult orElse(),
  }) {
    if (presentSaveCompleted != null) {
      return presentSaveCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentModel value) presentModel,
    required TResult Function(_PresentSaveCompleted value) presentSaveCompleted,
    required TResult Function(_PresentEditingCancelled value)
        presentEditingCancelled,
    required TResult Function(_PresentCreateCancelled value)
        presentCreateCancelled,
  }) {
    return presentSaveCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
  }) {
    return presentSaveCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
    required TResult orElse(),
  }) {
    if (presentSaveCompleted != null) {
      return presentSaveCompleted(this);
    }
    return orElse();
  }
}

abstract class _PresentSaveCompleted implements TodoItemEditUseCaseOutput {
  const factory _PresentSaveCompleted() = _$_PresentSaveCompleted;
}

/// @nodoc
abstract class _$PresentEditingCancelledCopyWith<$Res> {
  factory _$PresentEditingCancelledCopyWith(_PresentEditingCancelled value,
          $Res Function(_PresentEditingCancelled) then) =
      __$PresentEditingCancelledCopyWithImpl<$Res>;
}

/// @nodoc
class __$PresentEditingCancelledCopyWithImpl<$Res>
    extends _$TodoItemEditUseCaseOutputCopyWithImpl<$Res>
    implements _$PresentEditingCancelledCopyWith<$Res> {
  __$PresentEditingCancelledCopyWithImpl(_PresentEditingCancelled _value,
      $Res Function(_PresentEditingCancelled) _then)
      : super(_value, (v) => _then(v as _PresentEditingCancelled));

  @override
  _PresentEditingCancelled get _value =>
      super._value as _PresentEditingCancelled;
}

/// @nodoc

class _$_PresentEditingCancelled implements _PresentEditingCancelled {
  const _$_PresentEditingCancelled();

  @override
  String toString() {
    return 'TodoItemEditUseCaseOutput.presentEditingCancelled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PresentEditingCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemEditPresentationModel model) presentModel,
    required TResult Function() presentSaveCompleted,
    required TResult Function() presentEditingCancelled,
    required TResult Function() presentCreateCancelled,
  }) {
    return presentEditingCancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
  }) {
    return presentEditingCancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
    required TResult orElse(),
  }) {
    if (presentEditingCancelled != null) {
      return presentEditingCancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentModel value) presentModel,
    required TResult Function(_PresentSaveCompleted value) presentSaveCompleted,
    required TResult Function(_PresentEditingCancelled value)
        presentEditingCancelled,
    required TResult Function(_PresentCreateCancelled value)
        presentCreateCancelled,
  }) {
    return presentEditingCancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
  }) {
    return presentEditingCancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
    required TResult orElse(),
  }) {
    if (presentEditingCancelled != null) {
      return presentEditingCancelled(this);
    }
    return orElse();
  }
}

abstract class _PresentEditingCancelled implements TodoItemEditUseCaseOutput {
  const factory _PresentEditingCancelled() = _$_PresentEditingCancelled;
}

/// @nodoc
abstract class _$PresentCreateCancelledCopyWith<$Res> {
  factory _$PresentCreateCancelledCopyWith(_PresentCreateCancelled value,
          $Res Function(_PresentCreateCancelled) then) =
      __$PresentCreateCancelledCopyWithImpl<$Res>;
}

/// @nodoc
class __$PresentCreateCancelledCopyWithImpl<$Res>
    extends _$TodoItemEditUseCaseOutputCopyWithImpl<$Res>
    implements _$PresentCreateCancelledCopyWith<$Res> {
  __$PresentCreateCancelledCopyWithImpl(_PresentCreateCancelled _value,
      $Res Function(_PresentCreateCancelled) _then)
      : super(_value, (v) => _then(v as _PresentCreateCancelled));

  @override
  _PresentCreateCancelled get _value => super._value as _PresentCreateCancelled;
}

/// @nodoc

class _$_PresentCreateCancelled implements _PresentCreateCancelled {
  const _$_PresentCreateCancelled();

  @override
  String toString() {
    return 'TodoItemEditUseCaseOutput.presentCreateCancelled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PresentCreateCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoItemEditPresentationModel model) presentModel,
    required TResult Function() presentSaveCompleted,
    required TResult Function() presentEditingCancelled,
    required TResult Function() presentCreateCancelled,
  }) {
    return presentCreateCancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
  }) {
    return presentCreateCancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoItemEditPresentationModel model)? presentModel,
    TResult Function()? presentSaveCompleted,
    TResult Function()? presentEditingCancelled,
    TResult Function()? presentCreateCancelled,
    required TResult orElse(),
  }) {
    if (presentCreateCancelled != null) {
      return presentCreateCancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentModel value) presentModel,
    required TResult Function(_PresentSaveCompleted value) presentSaveCompleted,
    required TResult Function(_PresentEditingCancelled value)
        presentEditingCancelled,
    required TResult Function(_PresentCreateCancelled value)
        presentCreateCancelled,
  }) {
    return presentCreateCancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
  }) {
    return presentCreateCancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentSaveCompleted value)? presentSaveCompleted,
    TResult Function(_PresentEditingCancelled value)? presentEditingCancelled,
    TResult Function(_PresentCreateCancelled value)? presentCreateCancelled,
    required TResult orElse(),
  }) {
    if (presentCreateCancelled != null) {
      return presentCreateCancelled(this);
    }
    return orElse();
  }
}

abstract class _PresentCreateCancelled implements TodoItemEditUseCaseOutput {
  const factory _PresentCreateCancelled() = _$_PresentCreateCancelled;
}
