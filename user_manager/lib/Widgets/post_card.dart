import 'package:flutter/material.dart';
import 'package:user_manager/Models/post_model.dart';

import 'main_info_text.dart';

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
