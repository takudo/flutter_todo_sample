import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'facebook_login_state.freezed.dart';

@freezed
abstract class FacebookLoginState with _$FacebookLoginState{

  FacebookLoginState._(); //private constructor
  factory FacebookLoginState({User account}) = _FacebookLoginState;

  get account => account;

  bool isLogin() {
    return account != null;
  }

}