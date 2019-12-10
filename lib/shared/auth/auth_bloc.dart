import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class AuthBloc {
  static AuthBloc instance;

  static AuthBloc getInstance() {
    if (instance == null) {
      instance = AuthBloc();
    }
    return instance;
  }

  AuthBloc() {
    authFirebase = FirebaseAuth.instance;
    statusOut = status.stream;
    statusIn = status.sink;
  }

  var status = BehaviorSubject<bool>.seeded(true);
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
            statusIn.add(true);
          } else {
            statusIn.add(false);
          }
        }
      }
    } catch (e) {
      throw e;
    }
  }

  Future<String> getJWT() async {
    try {
      var id = await user.getIdToken();
      print("Bearer " + id.token);
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
