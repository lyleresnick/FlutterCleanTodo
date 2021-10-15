// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'TodoListUseCaseOutput.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoListUseCaseOutputTearOff {
  const _$TodoListUseCaseOutputTearOff();

  _PresentModel presentModel(List<TodoListPresentationRowModel> model) {
    return _PresentModel(
      model,
    );
  }

  _PresentItemDetail presentItemDetail() {
    return const _PresentItemDetail();
  }
}

/// @nodoc
const $TodoListUseCaseOutput = _$TodoListUseCaseOutputTearOff();

/// @nodoc
mixin _$TodoListUseCaseOutput {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TodoListPresentationRowModel> model)
        presentModel,
    required TResult Function() presentItemDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TodoListPresentationRowModel> model)? presentModel,
    TResult Function()? presentItemDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TodoListPresentationRowModel> model)? presentModel,
    TResult Function()? presentItemDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentModel value) presentModel,
    required TResult Function(_PresentItemDetail value) presentItemDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentItemDetail value)? presentItemDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentItemDetail value)? presentItemDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListUseCaseOutputCopyWith<$Res> {
  factory $TodoListUseCaseOutputCopyWith(TodoListUseCaseOutput value,
          $Res Function(TodoListUseCaseOutput) then) =
      _$TodoListUseCaseOutputCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoListUseCaseOutputCopyWithImpl<$Res>
    implements $TodoListUseCaseOutputCopyWith<$Res> {
  _$TodoListUseCaseOutputCopyWithImpl(this._value, this._then);

  final TodoListUseCaseOutput _value;
  // ignore: unused_field
  final $Res Function(TodoListUseCaseOutput) _then;
}

/// @nodoc
abstract class _$PresentModelCopyWith<$Res> {
  factory _$PresentModelCopyWith(
          _PresentModel value, $Res Function(_PresentModel) then) =
      __$PresentModelCopyWithImpl<$Res>;
  $Res call({List<TodoListPresentationRowModel> model});
}

/// @nodoc
class __$PresentModelCopyWithImpl<$Res>
    extends _$TodoListUseCaseOutputCopyWithImpl<$Res>
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
              as List<TodoListPresentationRowModel>,
    ));
  }
}

/// @nodoc

class _$_PresentModel implements _PresentModel {
  const _$_PresentModel(this.model);

  @override
  final List<TodoListPresentationRowModel> model;

  @override
  String toString() {
    return 'TodoListUseCaseOutput.presentModel(model: $model)';
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
    required TResult Function(List<TodoListPresentationRowModel> model)
        presentModel,
    required TResult Function() presentItemDetail,
  }) {
    return presentModel(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TodoListPresentationRowModel> model)? presentModel,
    TResult Function()? presentItemDetail,
  }) {
    return presentModel?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TodoListPresentationRowModel> model)? presentModel,
    TResult Function()? presentItemDetail,
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
    required TResult Function(_PresentItemDetail value) presentItemDetail,
  }) {
    return presentModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentItemDetail value)? presentItemDetail,
  }) {
    return presentModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentItemDetail value)? presentItemDetail,
    required TResult orElse(),
  }) {
    if (presentModel != null) {
      return presentModel(this);
    }
    return orElse();
  }
}

abstract class _PresentModel implements TodoListUseCaseOutput {
  const factory _PresentModel(List<TodoListPresentationRowModel> model) =
      _$_PresentModel;

  List<TodoListPresentationRowModel> get model =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PresentModelCopyWith<_PresentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PresentItemDetailCopyWith<$Res> {
  factory _$PresentItemDetailCopyWith(
          _PresentItemDetail value, $Res Function(_PresentItemDetail) then) =
      __$PresentItemDetailCopyWithImpl<$Res>;
}

/// @nodoc
class __$PresentItemDetailCopyWithImpl<$Res>
    extends _$TodoListUseCaseOutputCopyWithImpl<$Res>
    implements _$PresentItemDetailCopyWith<$Res> {
  __$PresentItemDetailCopyWithImpl(
      _PresentItemDetail _value, $Res Function(_PresentItemDetail) _then)
      : super(_value, (v) => _then(v as _PresentItemDetail));

  @override
  _PresentItemDetail get _value => super._value as _PresentItemDetail;
}

/// @nodoc

class _$_PresentItemDetail implements _PresentItemDetail {
  const _$_PresentItemDetail();

  @override
  String toString() {
    return 'TodoListUseCaseOutput.presentItemDetail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PresentItemDetail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TodoListPresentationRowModel> model)
        presentModel,
    required TResult Function() presentItemDetail,
  }) {
    return presentItemDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TodoListPresentationRowModel> model)? presentModel,
    TResult Function()? presentItemDetail,
  }) {
    return presentItemDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TodoListPresentationRowModel> model)? presentModel,
    TResult Function()? presentItemDetail,
    required TResult orElse(),
  }) {
    if (presentItemDetail != null) {
      return presentItemDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentModel value) presentModel,
    required TResult Function(_PresentItemDetail value) presentItemDetail,
  }) {
    return presentItemDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentItemDetail value)? presentItemDetail,
  }) {
    return presentItemDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentModel value)? presentModel,
    TResult Function(_PresentItemDetail value)? presentItemDetail,
    required TResult orElse(),
  }) {
    if (presentItemDetail != null) {
      return presentItemDetail(this);
    }
    return orElse();
  }
}

abstract class _PresentItemDetail implements TodoListUseCaseOutput {
  const factory _PresentItemDetail() = _$_PresentItemDetail;
}
