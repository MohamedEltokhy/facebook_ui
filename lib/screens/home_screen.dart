import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circle_button.dart';
import 'package:flutter_facebook_responsive_ui/widgets/contacts_list.dart';
import 'package:flutter_facebook_responsive_ui/widgets/create_post_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/more_option_list.dart';
import 'package:flutter_facebook_responsive_ui/widgets/post_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter_facebook_responsive_ui/widgets/rooms.dart';
import 'package:flutter_facebook_responsive_ui/widgets/stories.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TrackingScrollController _trackingScrollController =
  TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:_HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({Key? key, required this.scrollController}) : super(key: key);

  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        // header
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            "facebook",
            style: TextStyle(
              color: Palette.facebookBlue,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            // search button
            CircleButton(
                icon: Icons.search,
                iconSize: 30,
                onPressed: () => print('search')),
             // messenger button
            CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30,
                onPressed: () => print('messenger')),
          ],
        ),
        // post container
        SliverToBoxAdapter(
          child: CreatePostContainer(
            currentUser: currentUser,
          ),
        ),
        // Rooms
        SliverPadding(
          padding: EdgeInsets.only(top: 15),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        // Stories
        SliverPadding(
          padding: EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        // Posts
        SliverList(
          delegate: SliverChildBuilderDelegate((_, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  const _HomeScreenDesktop({Key? key, required this.scrollController}) : super(key: key);

  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // more
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        Spacer(),
        // posts
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              // Stories
              SliverPadding(
                padding: EdgeInsets.only(top: 20,bottom: 10),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),
              // post container
              SliverToBoxAdapter(
                child: CreatePostContainer(
                  currentUser: currentUser,
                ),
              ),
              // Rooms
              SliverPadding(
                padding: EdgeInsets.only(top: 15),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              // Posts
              SliverList(
                delegate: SliverChildBuilderDelegate((_, index) {
                  final Post post = posts[index];
                  return PostContainer(post: post);
                },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        // connects
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}