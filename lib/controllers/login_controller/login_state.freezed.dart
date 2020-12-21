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
      {AppUser appUser,
      User googleAccount,
      User facebookAccount,
      bool initialized = false}) {
    return _LoginState(
      appUser: appUser,
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
  AppUser get appUser;
  User get googleAccount;
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
      {AppUser appUser,
      User googleAccount,
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
    Object appUser = freezed,
    Object googleAccount = freezed,
    Object facebookAccount = freezed,
    Object initialized = freezed,
  }) {
    return _then(_value.copyWith(
      appUser: appUser == freezed ? _value.appUser : appUser as AppUser,
      googleAccount: googleAccount == freezed
          ? _value.googleAccount
          : googleAccount as User,
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
      {AppUser appUser,
      User googleAccount,
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
    Object appUser = freezed,
    Object googleAccount = freezed,
    Object facebookAccount = freezed,
    Object initialized = freezed,
  }) {
    return _then(_LoginState(
      appUser: appUser == freezed ? _value.appUser : appUser as AppUser,
      googleAccount: googleAccount == freezed
          ? _value.googleAccount
          : googleAccount as User,
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
      {this.appUser,
      this.googleAccount,
      this.facebookAccount,
      this.initialized = false})
      : assert(initialized != null),
        super._();

  @override
  final AppUser appUser;
  @override
  final User googleAccount;
  @override
  final User facebookAccount;
  @JsonKey(defaultValue: false)
  @override
  final bool initialized;

  @override
  String toString() {
    return 'LoginState(appUser: $appUser, googleAccount: $googleAccount, facebookAccount: $facebookAccount, initialized: $initialized)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginState &&
            (identical(other.appUser, appUser) ||
                const DeepCollectionEquality()
                    .equals(other.appUser, appUser)) &&
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
      const DeepCollectionEquality().hash(appUser) ^
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
      {AppUser appUser,
      User googleAccount,
      User facebookAccount,
      bool initialized}) = _$_LoginState;

  @override
  AppUser get appUser;
  @override
  User get googleAccount;
  @override
  User get facebookAccount;
  @override
  bool get initialized;
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith;
}
