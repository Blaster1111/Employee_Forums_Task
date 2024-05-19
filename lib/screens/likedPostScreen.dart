import 'package:employee_forums_task/providers/likedPostProvider.dart';
import 'package:employee_forums_task/providers/postProvider.dart';
import 'package:employee_forums_task/widgets/postCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikedPostsScreen extends StatelessWidget {
  const LikedPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Posts'),
      ),
      body: Consumer2<PostProvider, LikedPostsProvider>(
        builder: (context, postProvider, likedPostsProvider, child) {
          final allPosts = postProvider.posts;
          final likedPostIds = likedPostsProvider.likedPostIds;

          final likedPosts =
              allPosts.where((post) => likedPostIds.contains(post.id)).toList();

          return ListView.builder(
            itemCount: likedPosts.length,
            itemBuilder: (context, index) {
              final post = likedPosts[index];
              return PostCardWidget(post: post);
            },
          );
        },
      ),
    );
  }
}
