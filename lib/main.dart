import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik2/config/theme/app_theme.dart';
import 'package:toktik2/domain/repositories/video_post_repository.dart';
import 'package:toktik2/intfrastructure/datasources/local_videos.dart';
import 'package:toktik2/intfrastructure/repositories/video_post_repository.dart';
import 'package:toktik2/presentation/providers/discover_provider.dart';
import 'package:toktik2/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostRepositoryImpl(videoPostDatasource: LocalVideoDataSourceImp());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => DiscoverProvider(
              videoPostRepository: videoPostRepository
            )..loadNextPage())
      ],
      child: MaterialApp(
          title: 'Toktik',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: DiscoverScreen()),
    );
  }
}
