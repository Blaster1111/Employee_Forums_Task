import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employee_forums_task/providers/postProvider.dart';
import 'package:employee_forums_task/widgets/appBarWidget.dart';
import 'package:employee_forums_task/widgets/bottomNavigation.dart';
import 'package:employee_forums_task/widgets/postCardWidget.dart';
import 'package:employee_forums_task/widgets/textFieldWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: const TextFieldWidget(),
          ),
          Expanded(
            child: Consumer<PostProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading && provider.posts.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                      provider.fetchAndSetPosts(loadMore: true);
                    }
                    return true;
                  },
                  child: ListView.builder(
                    itemCount: provider.posts.length + 1,
                    itemBuilder: (context, index) {
                      if (index == provider.posts.length) {
                        return provider.hasMore
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink();
                      }
                      return PostCardWidget(post: provider.posts[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
