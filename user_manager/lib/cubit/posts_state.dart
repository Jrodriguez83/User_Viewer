part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class LoadedPosts extends PostsState {
  LoadedPosts({required this.posts});

  final List<Post> posts;
}

class PostErrorHandler extends PostsState {
  final String error;

  PostErrorHandler({this.error = ''});
}
