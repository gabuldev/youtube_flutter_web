import 'package:flutter/material.dart';
import 'package:interact/shared/utils/screen_util.dart';

class SearchWidget extends StatefulWidget {
  final Function(String text) onSearch;
  SearchWidget({Key key, this.onSearch}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String text;

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 30,
      child: Row(
        children: <Widget>[
          if (enableByScreen(size.width))
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Color(0xFFC6C6C6))),
                child: TextField(
                  onChanged: (value) => text = value,
                  onSubmitted: (value) => widget.onSearch(value),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: -6, left: 8),
                      hintText: "Pesquisar",
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.keyboard)),
                ),
              ),
            ),
          FlatButton(
            color: Color(0xFFF8F8F8),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFC6C6C6))),
            child: Icon(
              Icons.search,
              color: Color(0xFFC6C6C6),
            ),
            onPressed: () {
              widget.onSearch(text);
            },
          )
        ],
      ),
    );
  }
}
