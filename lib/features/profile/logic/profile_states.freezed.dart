// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileStates<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileLoading,
    required TResult Function(T data) profileSuccess,
    required TResult Function(String error) profileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileLoading,
    TResult? Function(T data)? profileSuccess,
    TResult? Function(String error)? profileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileLoading,
    TResult Function(T data)? profileSuccess,
    TResult Function(String error)? profileError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileLoading<T> value) profileLoading,
    required TResult Function(ProfileSuccess<T> value) profileSuccess,
    required TResult Function(ProfileError<T> value) profileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileLoading<T> value)? profileLoading,
    TResult? Function(ProfileSuccess<T> value)? profileSuccess,
    TResult? Function(ProfileError<T> value)? profileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileLoading<T> value)? profileLoading,
    TResult Function(ProfileSuccess<T> value)? profileSuccess,
    TResult Function(ProfileError<T> value)? profileError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStatesCopyWith<T, $Res> {
  factory $ProfileStatesCopyWith(
          ProfileStates<T> value, $Res Function(ProfileStates<T>) then) =
      _$ProfileStatesCopyWithImpl<T, $Res, ProfileStates<T>>;
}

/// @nodoc
class _$ProfileStatesCopyWithImpl<T, $Res, $Val extends ProfileStates<T>>
    implements $ProfileStatesCopyWith<T, $Res> {
  _$ProfileStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ProfileStatesCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProfileStates<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileLoading,
    required TResult Function(T data) profileSuccess,
    required TResult Function(String error) profileError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileLoading,
    TResult? Function(T data)? profileSuccess,
    TResult? Function(String error)? profileError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileLoading,
    TResult Function(T data)? profileSuccess,
    TResult Function(String error)? profileError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileLoading<T> value) profileLoading,
    required TResult Function(ProfileSuccess<T> value) profileSuccess,
    required TResult Function(ProfileError<T> value) profileError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileLoading<T> value)? profileLoading,
    TResult? Function(ProfileSuccess<T> value)? profileSuccess,
    TResult? Function(ProfileError<T> value)? profileError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileLoading<T> value)? profileLoading,
    TResult Function(ProfileSuccess<T> value)? profileSuccess,
    TResult Function(ProfileError<T> value)? profileError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ProfileStates<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$ProfileLoadingImplCopyWith<T, $Res> {
  factory _$$ProfileLoadingImplCopyWith(_$ProfileLoadingImpl<T> value,
          $Res Function(_$ProfileLoadingImpl<T>) then) =
      __$$ProfileLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ProfileLoadingImplCopyWithImpl<T, $Res>
    extends _$ProfileStatesCopyWithImpl<T, $Res, _$ProfileLoadingImpl<T>>
    implements _$$ProfileLoadingImplCopyWith<T, $Res> {
  __$$ProfileLoadingImplCopyWithImpl(_$ProfileLoadingImpl<T> _value,
      $Res Function(_$ProfileLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileLoadingImpl<T> implements ProfileLoading<T> {
  const _$ProfileLoadingImpl();

  @override
  String toString() {
    return 'ProfileStates<$T>.profileLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileLoading,
    required TResult Function(T data) profileSuccess,
    required TResult Function(String error) profileError,
  }) {
    return profileLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileLoading,
    TResult? Function(T data)? profileSuccess,
    TResult? Function(String error)? profileError,
  }) {
    return profileLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileLoading,
    TResult Function(T data)? profileSuccess,
    TResult Function(String error)? profileError,
    required TResult orElse(),
  }) {
    if (profileLoading != null) {
      return profileLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileLoading<T> value) profileLoading,
    required TResult Function(ProfileSuccess<T> value) profileSuccess,
    required TResult Function(ProfileError<T> value) profileError,
  }) {
    return profileLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileLoading<T> value)? profileLoading,
    TResult? Function(ProfileSuccess<T> value)? profileSuccess,
    TResult? Function(ProfileError<T> value)? profileError,
  }) {
    return profileLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileLoading<T> value)? profileLoading,
    TResult Function(ProfileSuccess<T> value)? profileSuccess,
    TResult Function(ProfileError<T> value)? profileError,
    required TResult orElse(),
  }) {
    if (profileLoading != null) {
      return profileLoading(this);
    }
    return orElse();
  }
}

abstract class ProfileLoading<T> implements ProfileStates<T> {
  const factory ProfileLoading() = _$ProfileLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ProfileSuccessImplCopyWith<T, $Res> {
  factory _$$ProfileSuccessImplCopyWith(_$ProfileSuccessImpl<T> value,
          $Res Function(_$ProfileSuccessImpl<T>) then) =
      __$$ProfileSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ProfileSuccessImplCopyWithImpl<T, $Res>
    extends _$ProfileStatesCopyWithImpl<T, $Res, _$ProfileSuccessImpl<T>>
    implements _$$ProfileSuccessImplCopyWith<T, $Res> {
  __$$ProfileSuccessImplCopyWithImpl(_$ProfileSuccessImpl<T> _value,
      $Res Function(_$ProfileSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ProfileSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ProfileSuccessImpl<T> implements ProfileSuccess<T> {
  const _$ProfileSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ProfileStates<$T>.profileSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSuccessImplCopyWith<T, _$ProfileSuccessImpl<T>> get copyWith =>
      __$$ProfileSuccessImplCopyWithImpl<T, _$ProfileSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileLoading,
    required TResult Function(T data) profileSuccess,
    required TResult Function(String error) profileError,
  }) {
    return profileSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileLoading,
    TResult? Function(T data)? profileSuccess,
    TResult? Function(String error)? profileError,
  }) {
    return profileSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileLoading,
    TResult Function(T data)? profileSuccess,
    TResult Function(String error)? profileError,
    required TResult orElse(),
  }) {
    if (profileSuccess != null) {
      return profileSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileLoading<T> value) profileLoading,
    required TResult Function(ProfileSuccess<T> value) profileSuccess,
    required TResult Function(ProfileError<T> value) profileError,
  }) {
    return profileSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileLoading<T> value)? profileLoading,
    TResult? Function(ProfileSuccess<T> value)? profileSuccess,
    TResult? Function(ProfileError<T> value)? profileError,
  }) {
    return profileSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileLoading<T> value)? profileLoading,
    TResult Function(ProfileSuccess<T> value)? profileSuccess,
    TResult Function(ProfileError<T> value)? profileError,
    required TResult orElse(),
  }) {
    if (profileSuccess != null) {
      return profileSuccess(this);
    }
    return orElse();
  }
}

abstract class ProfileSuccess<T> implements ProfileStates<T> {
  const factory ProfileSuccess(final T data) = _$ProfileSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$ProfileSuccessImplCopyWith<T, _$ProfileSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileErrorImplCopyWith<T, $Res> {
  factory _$$ProfileErrorImplCopyWith(_$ProfileErrorImpl<T> value,
          $Res Function(_$ProfileErrorImpl<T>) then) =
      __$$ProfileErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ProfileErrorImplCopyWithImpl<T, $Res>
    extends _$ProfileStatesCopyWithImpl<T, $Res, _$ProfileErrorImpl<T>>
    implements _$$ProfileErrorImplCopyWith<T, $Res> {
  __$$ProfileErrorImplCopyWithImpl(
      _$ProfileErrorImpl<T> _value, $Res Function(_$ProfileErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ProfileErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileErrorImpl<T> implements ProfileError<T> {
  const _$ProfileErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProfileStates<$T>.profileError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileErrorImplCopyWith<T, _$ProfileErrorImpl<T>> get copyWith =>
      __$$ProfileErrorImplCopyWithImpl<T, _$ProfileErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileLoading,
    required TResult Function(T data) profileSuccess,
    required TResult Function(String error) profileError,
  }) {
    return profileError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileLoading,
    TResult? Function(T data)? profileSuccess,
    TResult? Function(String error)? profileError,
  }) {
    return profileError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileLoading,
    TResult Function(T data)? profileSuccess,
    TResult Function(String error)? profileError,
    required TResult orElse(),
  }) {
    if (profileError != null) {
      return profileError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileLoading<T> value) profileLoading,
    required TResult Function(ProfileSuccess<T> value) profileSuccess,
    required TResult Function(ProfileError<T> value) profileError,
  }) {
    return profileError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileLoading<T> value)? profileLoading,
    TResult? Function(ProfileSuccess<T> value)? profileSuccess,
    TResult? Function(ProfileError<T> value)? profileError,
  }) {
    return profileError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileLoading<T> value)? profileLoading,
    TResult Function(ProfileSuccess<T> value)? profileSuccess,
    TResult Function(ProfileError<T> value)? profileError,
    required TResult orElse(),
  }) {
    if (profileError != null) {
      return profileError(this);
    }
    return orElse();
  }
}

abstract class ProfileError<T> implements ProfileStates<T> {
  const factory ProfileError({required final String error}) =
      _$ProfileErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$ProfileErrorImplCopyWith<T, _$ProfileErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
