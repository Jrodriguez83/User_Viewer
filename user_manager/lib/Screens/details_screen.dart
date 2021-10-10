import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/Models/post_model.dart';
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
          return _buildUserDetails(posts: posts, user: user);
        },
      ),
    );
  }

  Widget _buildUserDetails({
    required List<Post> posts,
    required User user,
  }) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildMainInfo(user: user),
            _buildPostCounter(posts: posts),
          ],
        ),
        _buildPostInfo(posts: posts),
      ],
    );
  }

  Widget _buildMainInfo({required User user}) {
    return Column(
      children: [
        MainInfoText(title: user.name),
        MainInfoText(title: user.email),
        MainInfoText(title: user.phoneNumber),
        MainInfoText(title: user.website),
        MainInfoText(title: user.address.city),
      ],
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

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              MainInfoText(title: 'Title: ${post.title}'),
              MainInfoText(title: 'Description: ${post.body}'),
            ],
          ),
        ),
      ),
    );
  }
}

class MainInfoText extends StatelessWidget {
  const MainInfoText({
    Key? key,
    required this.title,
    this.fontSize = 15,
  }) : super(key: key);
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}

Widget _buildPostCounter({required List<Post> posts}) {
  return Container(
    margin: const EdgeInsets.only(
      left: 20,
      right: 30,
      top: 20,
      bottom: 20,
    ),
    child: Column(
      children: [
        MainInfoText(
          title: 'Posts',
          fontSize: 35,
        ),
        MainInfoText(
          title: posts.length.toString(),
          fontSize: 35,
        ),
      ],
    ),
  );
}
