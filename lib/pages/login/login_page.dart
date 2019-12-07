import 'package:flutter/material.dart';
import 'package:interact/pages/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: RaisedButton(
          child: Text("Login Google"),
          onPressed: () {
            LoginBloc().signInGoogle();
          },
        ),
      ),
    );
  }
}
