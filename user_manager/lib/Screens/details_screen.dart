import 'package:flutter/material.dart';
import 'package:user_manager/Models/users_model.dart';
import 'package:user_manager/Widgets/main_info_text.dart';
import 'package:user_manager/Widgets/posts_section.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: _buildUserDetails(user: user));
  }

  Widget _buildUserDetails({
    required User user,
  }) {
    return ListView(
      children: [_buildMainInfo(user: user), PostSection(id: user.id)],
    );
  }

  Widget _buildMainInfo({required User user}) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          MainInfoText(
            leading: 'Username: ',
            title: user.username,
            fontSize: 20,
          ),
          MainInfoText(
            leading: 'Email: ',
            title: user.email,
            fontSize: 20,
          ),
          MainInfoText(
            leading: 'Phone Number: ',
            title: user.phoneNumber,
            fontSize: 20,
          ),
          MainInfoText(
            leading: 'Website: ',
            title: user.website,
            fontSize: 20,
          ),
          MainInfoText(
            leading: 'Address: ',
            title: user.address.city,
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}
