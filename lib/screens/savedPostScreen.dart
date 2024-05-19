import 'package:employee_forums_task/providers/postProvider.dart';
import 'package:employee_forums_task/providers/savedPostProvider.dart';

import 'package:employee_forums_task/widgets/postCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedPostsScreen extends StatelessWidget {
  const SavedPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Posts'),
      ),
      body: Consumer2<PostProvider, SavedPostsProvider>(
        builder: (context, postProvider, savedPostsProvider, child) {
          final allPosts = postProvider.posts;
          final savedPostIds = savedPostsProvider.savedPostIds;

          final savedPosts =
              allPosts.where((post) => savedPostIds.contains(post.id)).toList();

          return ListView.builder(
            itemCount: savedPosts.length,
            itemBuilder: (context, index) {
              final post = savedPosts[index];
              return PostCardWidget(post: post);
            },
          );
        },
      ),
    );
  }
}
