import 'package:flutter/material.dart';
import 'package:user_manager/Models/users_model.dart';
import 'package:user_manager/Widgets/main_info_text.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              icon: Icons.email_rounded,
            ),
            MainInfoText(
              leading: 'Phone Number: ',
              title: user.phoneNumber,
              fontSize: 20,
              icon: Icons.local_phone_rounded,
            ),
            MainInfoText(
              leading: 'Website: ',
              title: user.website,
              fontSize: 20,
              icon: Icons.public,
            ),
            MainInfoText(
              leading: 'Address: ',
              title: user.address.city,
              fontSize: 20,
              icon: Icons.location_on_sharp,
            ),
          ],
        ),
      ),
    );
  }
}
