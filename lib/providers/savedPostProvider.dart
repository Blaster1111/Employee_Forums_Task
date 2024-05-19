import 'package:employee_forums_task/providers/postProvider.dart';
import 'package:flutter/foundation.dart';

class SavedPostsProvider extends ChangeNotifier {
  final Set<String> _savedPostIds = {};

  Set<String> get savedPostIds => _savedPostIds;

  void toggleSavePost(Post post) {
    final postId = post.id;
    if (_savedPostIds.contains(postId)) {
      _savedPostIds.remove(postId);
    } else {
      _savedPostIds.add(postId);
    }
    notifyListeners();
  }
}
