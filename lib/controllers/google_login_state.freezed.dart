// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'google_login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GoogleLoginStateTearOff {
  const _$GoogleLoginStateTearOff();

// ignore: unused_element
  _GoogleLoginState call({GoogleSignInAccount account}) {
    return _GoogleLoginState(
      account: account,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GoogleLoginState = _$GoogleLoginStateTearOff();

/// @nodoc
mixin _$GoogleLoginState {
  GoogleSignInAccount get account;

  $GoogleLoginStateCopyWith<GoogleLoginState> get copyWith;
}

/// @nodoc
abstract class $GoogleLoginStateCopyWith<$Res> {
  factory $GoogleLoginStateCopyWith(
          GoogleLoginState value, $Res Function(GoogleLoginState) then) =
      _$GoogleLoginStateCopyWithImpl<$Res>;
  $Res call({GoogleSignInAccount account});
}

/// @nodoc
class _$GoogleLoginStateCopyWithImpl<$Res>
    implements $GoogleLoginStateCopyWith<$Res> {
  _$GoogleLoginStateCopyWithImpl(this._value, this._then);

  final GoogleLoginState _value;
  // ignore: unused_field
  final $Res Function(GoogleLoginState) _then;

  @override
  $Res call({
    Object account = freezed,
  }) {
    return _then(_value.copyWith(
      account:
          account == freezed ? _value.account : account as GoogleSignInAccount,
    ));
  }
}

/// @nodoc
abstract class _$GoogleLoginStateCopyWith<$Res>
    implements $GoogleLoginStateCopyWith<$Res> {
  factory _$GoogleLoginStateCopyWith(
          _GoogleLoginState value, $Res Function(_GoogleLoginState) then) =
      __$GoogleLoginStateCopyWithImpl<$Res>;
  @override
  $Res call({GoogleSignInAccount account});
}

/// @nodoc
class __$GoogleLoginStateCopyWithImpl<$Res>
    extends _$GoogleLoginStateCopyWithImpl<$Res>
    implements _$GoogleLoginStateCopyWith<$Res> {
  __$GoogleLoginStateCopyWithImpl(
      _GoogleLoginState _value, $Res Function(_GoogleLoginState) _then)
      : super(_value, (v) => _then(v as _GoogleLoginState));

  @override
  _GoogleLoginState get _value => super._value as _GoogleLoginState;

  @override
  $Res call({
    Object account = freezed,
  }) {
    return _then(_GoogleLoginState(
      account:
          account == freezed ? _value.account : account as GoogleSignInAccount,
    ));
  }
}

/// @nodoc
class _$_GoogleLoginState extends _GoogleLoginState {
  _$_GoogleLoginState({this.account}) : super._();

  @override
  final GoogleSignInAccount account;

  @override
  String toString() {
    return 'GoogleLoginState(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoogleLoginState &&
            (identical(other.account, account) ||
                const DeepCollectionEquality().equals(other.account, account)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(account);

  @override
  _$GoogleLoginStateCopyWith<_GoogleLoginState> get copyWith =>
      __$GoogleLoginStateCopyWithImpl<_GoogleLoginState>(this, _$identity);
}

abstract class _GoogleLoginState extends GoogleLoginState {
  _GoogleLoginState._() : super._();
  factory _GoogleLoginState({GoogleSignInAccount account}) =
      _$_GoogleLoginState;

  @override
  GoogleSignInAccount get account;
  @override
  _$GoogleLoginStateCopyWith<_GoogleLoginState> get copyWith;
}
