import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/Models/post_model.dart';
import 'package:user_manager/Widgets/post_card.dart';
import 'package:user_manager/cubit/posts_cubit.dart';

class PostTab extends StatelessWidget {
  const PostTab({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostsCubit>(context).getUsersPosts(id);
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is! LoadedPosts && state is! PostErrorHandler) {
          //Displays a progress indicator only when there's not an error and the posts are still loading
          return const SingleChildScrollView(
            child: SizedBox(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if (state is PostErrorHandler) {
          //Displays an error message when an error is occured loading the data
          final error = state.error;
          return Center(
            child: InkWell(
                onTap: () =>
                    BlocProvider.of<PostsCubit>(context).getUsersPosts(id),
                child: Text(error)),
          );
        }
        final posts = (state as LoadedPosts).posts;
        //Shows the user's posts
        return _buildPostList(context, posts);
      },
    );
  }

  Column _buildPostList(BuildContext context, List<Post> posts) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: posts
                    .map((post) => PostCard(
                          key: ObjectKey(post.id),
                          post: post,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
