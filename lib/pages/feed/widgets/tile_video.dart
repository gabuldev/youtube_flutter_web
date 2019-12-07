import 'package:flutter/material.dart';
import 'package:interact/pages/feed/feed_repository.dart';
import 'package:interact/shared/models/video_model.dart';
import 'package:interact/shared/service/custom_dio.dart';
import 'package:interact/shared/utils/transform_util.dart';

class TileVideo extends StatelessWidget {
  final VideoModel snapshot;
  const TileVideo({Key key, @required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(snapshot.url), fit: BoxFit.cover)),
            ),
          ),
          ListTile(
            isThreeLine: true,
            title: Text(
              snapshot.title,
            ),
            leading: FutureBuilder<String>(
              future: FeedRepository(CustomDio())
                  .getImage(idChannel: snapshot.idChannel),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(snapshot.data),
                  );
                } else {
                  return Container(
                    width: 0,
                    height: 0,
                  );
                }
              },
            ),
            subtitle: FutureBuilder<String>(
                future: FeedRepository(CustomDio())
                    .getStatistics(idVideo: snapshot.id),
                builder: (context, future) {
                  if (future.hasData) {
                    return Text(
                      "${snapshot.channelTitle} ● ${TransformUtil.views(future.data)} há ${TransformUtil.dateParse(snapshot.publishedAt)}",
                    );
                  } else {
                    return Text("...");
                  }
                }),
          )
        ],
      ),
    );
  }
}
