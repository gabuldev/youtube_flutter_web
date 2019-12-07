import 'package:dio/dio.dart';
import 'package:interact/shared/models/video_model.dart';

class FeedRepository {
  final Dio client;

  FeedRepository(this.client);

  Future<List<VideoModel>> getVideos({String search}) async {
    var response = await client.get('/search', queryParameters: {
      'key': 'AIzaSyAPzdDA5azRi2VFdVcN-9VsAVjLbHK2cvk',
      //'channelId': 'UC13gar1iS-icxHq7wEQLPaQ',
      'part': 'snippet,id',
      'order': 'date',
      'maxResults': 20,
      'q': search ?? 'flutterando'
    });
    return (response.data['items'] as List)
        .map((i) => VideoModel.fromJson(i))
        .toList();
  }

  Future<String> getImage({String idChannel}) async {
    var response = await client.get("/channels", queryParameters: {
      'key': 'AIzaSyAPzdDA5azRi2VFdVcN-9VsAVjLbHK2cvk',
      'part': 'snippet',
      'id': idChannel
    });
    return (response.data['items'] as List).first['snippet']['thumbnails']
        ['high']['url'];
  }

  Future<String> getStatistics({String idVideo}) async {
    var response = await client.get("/videos", queryParameters: {
      'key': 'AIzaSyAPzdDA5azRi2VFdVcN-9VsAVjLbHK2cvk',
      'part': 'statistics',
      'id': idVideo
    });
    return (response.data['items'] as List).first['statistics']['viewCount'];
  }
}
