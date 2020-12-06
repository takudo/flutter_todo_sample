import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/all.dart';
import 'google_login_state.dart';

final googleLoginProvider = StateNotifierProvider((ref) => GoogleLoginController());

class GoogleLoginController extends StateNotifier<GoogleLoginState> {
  GoogleLoginController() : super(GoogleLoginState()) ;

  final googleSignin = GoogleSignIn(
    scopes: <String>[
      'email',
      'profile' // 参考: スコープ一覧 https://developers.google.com/identity/protocols/oauth2/scopes#google-sign-in
    ],
  );


  init() async {
    if((await googleSignin.isSignedIn()) && state.account == null) {
      final account = await googleSignin.signInSilently();
      if(account != null) {
        state = state.copyWith(account: account);
      }
    }
  }

  login() async {
    final account = await googleSignin.signIn();
    state = state.copyWith(account: account);
  }

  logout() async {
    final account = await googleSignin.signOut();
    state = state.copyWith(account: account);
  }

}