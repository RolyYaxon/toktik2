import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik2/presentation/providers/discover_provider.dart';

import '../../widgets/shared/video_scroll_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();

    return  Scaffold(
      body: discoverProvider.initialLoading 
      ? const Center(child: CircularProgressIndicator(strokeWidth: 2,))
      : VideoScrollView(videos: discoverProvider.videos,)
    );
  }
}
