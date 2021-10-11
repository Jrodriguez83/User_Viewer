import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_manager/Models/post_model.dart';
import 'package:user_manager/NetworkCalls/posts_api.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  void getUsersPosts(int userId) {
    final postApi = PostsApi();
    postApi
        .fetchUserPost(userId)
        .then((posts) => emit(LoadedPosts(posts: posts)))
        .catchError((_) {
      emit(PostErrorHandler(
          error: 'An error has occured! Please press to retry'));
    });
  }
}
