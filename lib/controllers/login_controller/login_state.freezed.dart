// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

// ignore: unused_element
  _LoginState call(
      {GoogleSignInAccount googleAccount,
      User facebookAccount,
      bool initialized = false}) {
    return _LoginState(
      googleAccount: googleAccount,
      facebookAccount: facebookAccount,
      initialized: initialized,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  GoogleSignInAccount get googleAccount;
  User get facebookAccount;
  bool get initialized;

  $LoginStateCopyWith<LoginState> get copyWith;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {GoogleSignInAccount googleAccount,
      User facebookAccount,
      bool initialized});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object googleAccount = freezed,
    Object facebookAccount = freezed,
    Object initialized = freezed,
  }) {
    return _then(_value.copyWith(
      googleAccount: googleAccount == freezed
          ? _value.googleAccount
          : googleAccount as GoogleSignInAccount,
      facebookAccount: facebookAccount == freezed
          ? _value.facebookAccount
          : facebookAccount as User,
      initialized:
          initialized == freezed ? _value.initialized : initialized as bool,
    ));
  }
}

/// @nodoc
abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {GoogleSignInAccount googleAccount,
      User facebookAccount,
      bool initialized});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object googleAccount = freezed,
    Object facebookAccount = freezed,
    Object initialized = freezed,
  }) {
    return _then(_LoginState(
      googleAccount: googleAccount == freezed
          ? _value.googleAccount
          : googleAccount as GoogleSignInAccount,
      facebookAccount: facebookAccount == freezed
          ? _value.facebookAccount
          : facebookAccount as User,
      initialized:
          initialized == freezed ? _value.initialized : initialized as bool,
    ));
  }
}

/// @nodoc
class _$_LoginState extends _LoginState {
  _$_LoginState(
      {this.googleAccount, this.facebookAccount, this.initialized = false})
      : assert(initialized != null),
        super._();

  @override
  final GoogleSignInAccount googleAccount;
  @override
  final User facebookAccount;
  @JsonKey(defaultValue: false)
  @override
  final bool initialized;

  @override
  String toString() {
    return 'LoginState(googleAccount: $googleAccount, facebookAccount: $facebookAccount, initialized: $initialized)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginState &&
            (identical(other.googleAccount, googleAccount) ||
                const DeepCollectionEquality()
                    .equals(other.googleAccount, googleAccount)) &&
            (identical(other.facebookAccount, facebookAccount) ||
                const DeepCollectionEquality()
                    .equals(other.facebookAccount, facebookAccount)) &&
            (identical(other.initialized, initialized) ||
                const DeepCollectionEquality()
                    .equals(other.initialized, initialized)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(googleAccount) ^
      const DeepCollectionEquality().hash(facebookAccount) ^
      const DeepCollectionEquality().hash(initialized);

  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  _LoginState._() : super._();
  factory _LoginState(
      {GoogleSignInAccount googleAccount,
      User facebookAccount,
      bool initialized}) = _$_LoginState;

  @override
  GoogleSignInAccount get googleAccount;
  @override
  User get facebookAccount;
  @override
  bool get initialized;
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith;
}
