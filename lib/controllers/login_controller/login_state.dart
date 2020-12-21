import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo_sample/entities/app_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState{

  LoginState._(); //private constructor
  factory LoginState({
    AppUser appUser,
    User googleAccount,
    User facebookAccount,
    @Default(false) bool initialized
  }) = _LoginState;

  bool get isLogin => isGoogleLogin || isFacebookLogin;
  bool get isGoogleLogin => googleAccount != null;
  bool get isFacebookLogin => facebookAccount != null;

}