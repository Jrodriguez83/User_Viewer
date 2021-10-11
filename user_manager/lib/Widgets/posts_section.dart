import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/Models/post_model.dart';
import 'package:user_manager/Widgets/post_card.dart';
import 'package:user_manager/cubit/posts_cubit.dart';

class PostSection extends StatelessWidget {
  const PostSection({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostsCubit>(context).getUsersPosts(id);
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is! LoadedPosts && state is! PostErrorHandler) {
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
          final error = state.error;
          return Center(
            child: InkWell(
                onTap: () =>
                    BlocProvider.of<PostsCubit>(context).getUsersPosts(id),
                child: Text(error)),
          );
        }
        final posts = (state as LoadedPosts).posts;
        return Column(
          children: [
            _buildPostCounter(posts: posts),
            _buildPostInfo(posts: posts),
          ],
        );
      },
    );
  }
}

Widget _buildPostInfo({required List<Post> posts}) {
  return Column(
    children: posts
        .map((post) => PostCard(
              post: post,
            ))
        .toList(),
  );
}

Widget _buildPostCounter({required List<Post> posts}) {
  return Container(
    margin: const EdgeInsets.all(15),
    child: const Text(
      'Posts: ',
      style: TextStyle(
        fontSize: 35,
      ),
    ),
  );
}
