import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';

class Rooms extends StatelessWidget {
  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);
  final List<User> onlineUsers;

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
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 4),
          itemCount: 1 + onlineUsers.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_,index){
            if(index == 0){
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }
        ),
      ),
    );
  }
}


class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        onPressed: ()=> print('Create Room'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        borderSide: BorderSide(
          width: 3,
          color: Colors.blueAccent,
        ),
        textColor: Palette.facebookBlue,
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (rect)=>
              Palette.createRoomGradient.createShader(rect),
              child: Icon(
                  Icons.video_call,
                size: 35,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4,),
            Text("Create\nRoom")
          ],
        )
    );
  }
}

