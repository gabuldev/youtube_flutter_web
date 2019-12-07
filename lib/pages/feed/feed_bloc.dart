import 'package:interact/pages/feed/feed_repository.dart';
import 'package:interact/shared/models/video_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class FeedBloc {
  final FeedRepository repo;
  FeedBloc(this.repo) {
    videosIn = videos.sink;
    videosOut = videos.stream;
    getVideos();
  }

  var videos = BehaviorSubject<List<VideoModel>>();
  Observable<List<VideoModel>> videosOut;
  Sink<List<VideoModel>> videosIn;

  void getVideos({String search}) async {
    videosIn.add(null);
    try {
      var response = await repo.getVideos(search: search);
      videosIn.add(response);
    } catch (e) {
      videos.addError(e);
    }
  }

  void dispose() {
    videos.close();
    videosIn.close();
  }
}
