import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0,vertical: 5),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
          : null,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  SizedBox(
                    height: 4,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? SizedBox.shrink()
                      : SizedBox(
                          height: 6,
                        ),
                ],
              ),
            ),
            post.imageUrl != ""
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: _PostStats(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} . ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () => print("More"), icon: Icon(Icons.more_horiz)),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  const _PostStats({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // like , share , comment
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4,),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              "${post.comments} Comments",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 8,),
            Text(
              "${post.shares} Shares",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Divider(),
        //
        Row(
          children: [
            // like
            _PostButton(
              icon : Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: 'Like',
              onTap:()=> print('Like'),
            ),
            // comment
            _PostButton(
              icon : Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: 'Comment',
              onTap:()=> print('Comment'),
            ),
            // share
            _PostButton(
              icon : Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25,
              ),
              label: 'Share',
              onTap:()=> print('Share'),
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap
  }) : super(key: key);

  final Icon icon;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 4,),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
