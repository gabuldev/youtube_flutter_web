import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interact/shared/auth/auth_bloc.dart';

class LoginBloc {
  Future<bool> signInGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        AuthResult authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (authResult.user != null) {
          AuthBloc.getInstance().user = authResult.user;
          AuthBloc.getInstance().statusIn.add(true);
        }
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
