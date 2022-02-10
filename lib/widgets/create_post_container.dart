import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
          : null,
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 8),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind?",
                    ),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              height: 10,
              thickness: .5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () => print('Live'),
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text(
                      "Live",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                    onPressed: () => print('Photo'),
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text(
                      "Photo",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                    onPressed: () => print('Room'),
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: Text(
                      "Room",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
