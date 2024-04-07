import 'package:toktik2/domain/datasource/video_post_datasource.dart';
import 'package:toktik2/domain/entities/video_post.dart';
import 'package:toktik2/intfrastructure/models/local_video_model.dart';
import 'package:toktik2/shared/data/local_video_posts.dart';

class LocalVideoDataSourceImp implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
