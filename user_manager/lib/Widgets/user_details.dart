import 'package:flutter/material.dart';
import 'package:user_manager/Models/users_model.dart';
import 'package:user_manager/Widgets/info_tab.dart';
import 'package:user_manager/Widgets/posts_tab.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buidSliverAppBar(),
        _buildTabBar(context),
        _buildTabs(),
      ],
    );
  }

  SliverFillRemaining _buildTabs() {
    return SliverFillRemaining(
      child: TabBarView(children: [
        InfoTab(user: user),
        PostTab(id: user.id),
      ]),
    );
  }

  SliverToBoxAdapter _buildTabBar(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15,
        ),
        height: 55,
        child: TabBar(
          unselectedLabelColor: Theme.of(context).colorScheme.primary,
          indicator: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          automaticIndicatorColorAdjustment: true,
          tabs: const [
            Tab(
              child: Text('INFO'),
            ),
            Tab(text: 'POSTS')
          ],
        ),
      ),
    );
  }

  SliverAppBar _buidSliverAppBar() {
    return SliverAppBar(
      collapsedHeight: 140,
      flexibleSpace: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                bottom: 15,
              ),
              child: Text(
                user.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                user.companyName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
      expandedHeight: 140,
    );
  }
}
