import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'google_login_state.freezed.dart';

@freezed
abstract class GoogleLoginState with _$GoogleLoginState{

  // factory LoginState({GoogleSignInAccount account}) {
  //   final googleSignin = GoogleSignIn(
  //     scopes: <String>[
  //       'email',
  //       'profile' // 参考: スコープ一覧 https://developers.google.com/identity/protocols/oauth2/scopes#google-sign-in
  //     ],
  //   );
  //   googleSignin.signInSilently().then((a) => LoginState(account: a));
  //   return _LoginState;
  // }
  GoogleLoginState._(); //private constructor
  factory GoogleLoginState({GoogleSignInAccount account}) = _GoogleLoginState;

// GoogleLoginState._(this.account);

  get account => account;

  bool isLogin() {
    return account != null;
  }

}