import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/user_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  const MoreOptionsList({Key? key, required this.currentUser})
      : super(key: key);

  final User currentUser;

  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200),
      child: ListView.builder(
          itemCount: 1 + _moreOptionsList.length,
          itemBuilder: (_, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: UserCard(user: currentUser,),
              );
            }
            final List option = _moreOptionsList[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: _Option(
                icon: option[0],
                color: option[1],
                label: option[2],
              ),
            );
          }),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({Key? key, required this.icon, required this.color, required this.label}) : super(key: key);

  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> print(label),
      child: Row(
        children: [
          Icon(icon,size: 38,color: color,),
          SizedBox(width: 6,),
          Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              )
          ),
        ],
      ),
    );
  }
}
