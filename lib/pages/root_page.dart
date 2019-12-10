import 'package:flutter/material.dart';
import 'package:interact/pages/feed/feed_page.dart';
import 'package:interact/pages/login/login_page.dart';
import 'package:interact/shared/auth/auth_bloc.dart';

class RootPage extends StatefulWidget {
  final Key feedKey;
  RootPage({Key key, this.feedKey}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthBloc bloc;

  @override
  void initState() {
    bloc = AuthBloc.getInstance();
    bloc.currentUser();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: bloc.statusOut,
        initialData: true,
        builder: (context, snapshot) {
          return snapshot.data
              ? FeedPage(
                  key: widget.feedKey,
                )
              : LoginPage();
        });
  }
}
