import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class AuthBloc {
  static AuthBloc instance;

  static AuthBloc getInstance() {
    if (instance == null) {
      return AuthBloc();
    } else {
      return instance;
    }
  }

  AuthBloc() {
    authFirebase = FirebaseAuth.instance;
    statusOut = status.stream;
    statusIn = status.sink;
  }

  var status = BehaviorSubject<bool>.seeded(false);
  Observable<bool> statusOut;
  Sink<bool> statusIn;

  FirebaseUser user;
  FirebaseAuth authFirebase;

  Future<void> currentUser() async {
    try {
      if (authFirebase != null) {
        if (user == null) {
          user = await authFirebase.currentUser();
          if (user != null) {
            //AppModule.to.getBloc<AppBloc>().login();
          } else {
            //AppModule.to.getBloc<AppBloc>().logout();
          }
        }
      }
    } catch (e) {
      throw e;
    }
  }

  Future<String> getJWT() async {
    try {
      var id = await user.getIdToken(refresh: true);
      return "Bearer " + id.token;
    } catch (e) {
      throw e;
    }
  }

  Future logoutUser() async {
    FirebaseAuth.instance.signOut();
    // AppModule.to.getBloc<AppBloc>().logout();
  }

  void dispose() {
    status.close();
    statusIn.close();
    instance = null;
  }
}
