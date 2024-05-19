import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class Post {
  final String id;
  final String title;
  final String description;
  final String image;
  final String eventDescription;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.eventDescription,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Post && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class PostProvider extends ChangeNotifier {
  bool _showFullText = true;
  List<Post> _posts = [];
  bool _isLoading = false;
  bool _hasMore = true;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  bool get showFullText => _showFullText;
  bool get hasMore => _hasMore;

  PostProvider() {
    fetchAndSetPosts();
  }

  void setPosts(List<dynamic> postsData, {bool append = false}) {
    List<Post> newPosts = postsData.map((postData) {
      final uuid = Uuid().v4();

      return Post(
        id: uuid,
        title: postData['title'] ?? '',
        description: postData['description'] ?? '',
        image: postData['image'] != null && postData['image'].isNotEmpty
            ? postData['image'][0]
            : '',
        eventDescription: postData['eventDescription'] ?? '',
      );
    }).toList();

    if (append) {
      _posts.addAll(newPosts);
    } else {
      _posts = newPosts;
    }
    notifyListeners();
  }

  Future<void> fetchAndSetPosts({bool loadMore = false}) async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://post-api-omega.vercel.app/api/posts?page=1');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          setPosts(data, append: loadMore);
          _hasMore = true;
        } else {
          _hasMore = false;
        }
      } else {
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleShowFullText() {
    _showFullText = !_showFullText;
    notifyListeners();
  }
}
