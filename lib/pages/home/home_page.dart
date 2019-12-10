import 'package:flutter/material.dart';
import 'package:interact/pages/feed/feed_page.dart';
import 'package:interact/pages/home/widgets/app_bar_widget.dart';
import 'package:interact/pages/home/widgets/drawer_widget.dart';
import 'package:interact/pages/root_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var feedKey = GlobalKey<FeedPageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Builder(
              builder: (context) => AppBarWidget(
                onSearch: (value) {
                  var feed = feedKey.currentState;
                  feed.search(value);
                },
                openDrawer: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            )),
        drawer: DrawerWidget(),
        body: RootPage(
          feedKey: feedKey,
        ));
  }
}
