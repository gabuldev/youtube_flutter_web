import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interact/shared/auth/auth_bloc.dart';

class LoginBloc {
  Future<bool> signInGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'https://www.googleapis.com/auth/youtube',
        "https://www.googleapis.com/auth/youtube.force-ssl",
        "https://www.googleapis.com/auth/youtube.readonly",
        "https://www.googleapis.com/auth/youtubepartner"
      ],
    );
    GoogleSignInAccount googleUser;
    try {
      googleUser = await _googleSignIn.signIn();
    } catch (e) {
      print(e);
    }
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
    /* } catch (e) {
      print(e.error);
      return false;
    }*/
  }
}
