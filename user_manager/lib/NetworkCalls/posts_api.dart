import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_manager/Models/post_model.dart';

class PostsApi {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  Future<List<Post>> fetchUserPost(int userId) async {
    final _userPostsUrl = Uri.parse(_baseUrl + '/posts?userId=$userId');
    try {
      final _rawPosts = await http.get(_userPostsUrl);
      final _postsJson = jsonDecode(_rawPosts.body) as List;

      return _postsJson
          .map(
            (post) => Post(
              id: post['userId'],
              userId: post['id'],
              title: post['title'],
              body: post['body'],
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
