import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/screens/home_screen.dart';
import 'package:flutter_facebook_responsive_ui/widgets/custom_app_bar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/custom_tab_bar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {


  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screen = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
              preferredSize: Size(screenSize.width , 100),
              child: CustomAppBar(
                currentUser: currentUser,
                icons: _icons,
                selectedIndex: _selectedIndex,
                onTap:(index) => setState(() => _selectedIndex = index),
              ),
          )
              : null,
          body: IndexedStack(
            index: _selectedIndex,
            children: _screen,
          ),
          bottomNavigationBar: !Responsive.isDesktop(context) ? Container(
            padding: const EdgeInsets.only(bottom: 12,),
            child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap:(index) => setState(() => _selectedIndex = index),

            ),
          ) : SizedBox.shrink(),
        )
    );
  }
}
