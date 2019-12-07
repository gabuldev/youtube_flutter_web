import 'package:flutter/material.dart';
import 'package:interact/pages/feed/feed_bloc.dart';
import 'package:interact/pages/feed/feed_repository.dart';
import 'package:interact/pages/feed/widgets/tile_video.dart';
import 'package:interact/pages/login/login_bloc.dart';
import 'package:interact/shared/models/video_model.dart';
import 'package:interact/shared/service/custom_dio.dart';
import 'package:interact/shared/utils/screen_util.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key key}) : super(key: key);

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  FeedBloc bloc;

  @override
  void initState() {
    bloc = FeedBloc(FeedRepository(CustomDio()));
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  void search(String value) {
    bloc.getVideos(search: value);
  }

  int changeCountByWidth(double width) {
    ScreenType type = Screen.getTypeByWidth(width);
    switch (type) {
      case ScreenType.mobile:
        return 1;
      case ScreenType.tablet:
        return 2;
      case ScreenType.tabletExpanded:
        return 2;
      case ScreenType.windowShort:
        return 3;
      case ScreenType.windowExpanded:
        return 4;
      default:
        return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    return StreamBuilder<List<VideoModel>>(
        stream: bloc.videosOut,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return Scrollbar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: changeCountByWidth(size.width),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20),
                  itemBuilder: (context, index) => TileVideo(
                    snapshot: snapshot.data[index],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
