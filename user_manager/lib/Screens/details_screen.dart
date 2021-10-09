import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/Models/users_model.dart';
import 'package:user_manager/cubit/posts_cubit.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostsCubit>(context).getUsersPosts(user.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is! LoadedPosts) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final posts = state.posts;
          return Container(
            child: Column(
              children: [
                Text(user.name),
                Text(user.email),
                Text(user.phoneNumber),
                Text(user.website),
                ...posts.map((post) => Text(post.title))
              ],
            ),
          );
        },
      ),
    );
  }
}
