import 'package:flutter/material.dart';
import 'package:toktik2/domain/entities/video_post.dart';
import 'package:toktik2/presentation/widgets/shared/video_player/video_buttons.dart';

import '../video/fullscreen_player.dart';

class VideoScrollView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(

          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption,
              )
            ),
          Positioned(
            bottom: 40,
            right: 20,
            child: VideoButtons(video: videoPost))

          ],
        );
      },
    );
  }
}
