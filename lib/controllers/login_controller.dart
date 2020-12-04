import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/all.dart';
import 'login_state.dart';

final loginProvider = StateNotifierProvider((ref) => LoginController());

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState()) ;

  login() async {
    final googleSignin = GoogleSignIn(
      scopes: <String>[
        'email',
        'profile' // 参考: スコープ一覧 https://developers.google.com/identity/protocols/oauth2/scopes#google-sign-in
      ],
    );
    final account = await googleSignin.signInSilently();
    state = state.copyWith(account: account);
  }

}