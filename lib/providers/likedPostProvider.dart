import 'package:employee_forums_task/providers/postProvider.dart';
import 'package:flutter/foundation.dart';

class LikedPostsProvider extends ChangeNotifier {
  final Set<String> _likedPostIds = {};

  Set<String> get likedPostIds => _likedPostIds;

  void toggleLikePost(Post post) {
    final postId = post.id;
    if (_likedPostIds.contains(postId)) {
      _likedPostIds.remove(postId);
    } else {
      _likedPostIds.add(postId);
    }
    notifyListeners();
  }
}
