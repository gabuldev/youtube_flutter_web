import 'package:flutter/material.dart';
import 'package:interact/pages/home/widgets/search_widget.dart';
import 'package:interact/shared/utils/screen_util.dart';

class AppBarWidget extends StatefulWidget {
  final Function openDrawer;
  final Function(String text) onSearch;
  AppBarWidget({Key key, this.openDrawer, this.onSearch}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool enableByScreen(double width) {
    ScreenType type = Screen.getTypeByWidth(width);
    switch (type) {
      case ScreenType.mobile:
        return false;
      case ScreenType.tablet:
        return false;
      default:
        return true;
    }
  }

  int isScreenTablet(double width) {
    ScreenType type = Screen.getTypeByWidth(width);
    if (ScreenType.tabletExpanded == type) {
      return 3;
    } else if (ScreenType.tablet == type) {
      return 4;
    } else if (ScreenType.windowShort == type) {
      return 5;
    } else {
      return 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: widget.openDrawer,
                ),
              ),
              Container(
                //  child: Image.asset("assets/images/youtube-logo.png"),
                width: 100,
              ),
            ],
          ),
        ),
        if (enableByScreen(size.width))
          Expanded(
              flex: isScreenTablet(size.width),
              child: SearchWidget(
                onSearch: widget.onSearch,
              )),

        //Actions
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (!enableByScreen(size.width))
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              IconButton(
                icon: Icon(Icons.camera),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: CircleAvatar(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
