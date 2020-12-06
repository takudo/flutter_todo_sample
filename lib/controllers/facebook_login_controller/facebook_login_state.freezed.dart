// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'facebook_login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FacebookLoginStateTearOff {
  const _$FacebookLoginStateTearOff();

// ignore: unused_element
  _FacebookLoginState call({User account}) {
    return _FacebookLoginState(
      account: account,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FacebookLoginState = _$FacebookLoginStateTearOff();

/// @nodoc
mixin _$FacebookLoginState {
  User get account;

  $FacebookLoginStateCopyWith<FacebookLoginState> get copyWith;
}

/// @nodoc
abstract class $FacebookLoginStateCopyWith<$Res> {
  factory $FacebookLoginStateCopyWith(
          FacebookLoginState value, $Res Function(FacebookLoginState) then) =
      _$FacebookLoginStateCopyWithImpl<$Res>;
  $Res call({User account});
}

/// @nodoc
class _$FacebookLoginStateCopyWithImpl<$Res>
    implements $FacebookLoginStateCopyWith<$Res> {
  _$FacebookLoginStateCopyWithImpl(this._value, this._then);

  final FacebookLoginState _value;
  // ignore: unused_field
  final $Res Function(FacebookLoginState) _then;

  @override
  $Res call({
    Object account = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed ? _value.account : account as User,
    ));
  }
}

/// @nodoc
abstract class _$FacebookLoginStateCopyWith<$Res>
    implements $FacebookLoginStateCopyWith<$Res> {
  factory _$FacebookLoginStateCopyWith(
          _FacebookLoginState value, $Res Function(_FacebookLoginState) then) =
      __$FacebookLoginStateCopyWithImpl<$Res>;
  @override
  $Res call({User account});
}

/// @nodoc
class __$FacebookLoginStateCopyWithImpl<$Res>
    extends _$FacebookLoginStateCopyWithImpl<$Res>
    implements _$FacebookLoginStateCopyWith<$Res> {
  __$FacebookLoginStateCopyWithImpl(
      _FacebookLoginState _value, $Res Function(_FacebookLoginState) _then)
      : super(_value, (v) => _then(v as _FacebookLoginState));

  @override
  _FacebookLoginState get _value => super._value as _FacebookLoginState;

  @override
  $Res call({
    Object account = freezed,
  }) {
    return _then(_FacebookLoginState(
      account: account == freezed ? _value.account : account as User,
    ));
  }
}

/// @nodoc
class _$_FacebookLoginState extends _FacebookLoginState {
  _$_FacebookLoginState({this.account}) : super._();

  @override
  final User account;

  @override
  String toString() {
    return 'FacebookLoginState(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FacebookLoginState &&
            (identical(other.account, account) ||
                const DeepCollectionEquality().equals(other.account, account)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(account);

  @override
  _$FacebookLoginStateCopyWith<_FacebookLoginState> get copyWith =>
      __$FacebookLoginStateCopyWithImpl<_FacebookLoginState>(this, _$identity);
}

abstract class _FacebookLoginState extends FacebookLoginState {
  _FacebookLoginState._() : super._();
  factory _FacebookLoginState({User account}) = _$_FacebookLoginState;

  @override
  User get account;
  @override
  _$FacebookLoginStateCopyWith<_FacebookLoginState> get copyWith;
}
