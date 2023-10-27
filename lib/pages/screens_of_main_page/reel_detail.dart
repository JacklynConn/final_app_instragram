import 'package:expandable_text/expandable_text.dart';
import 'package:finalapp/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../../elements/user_list_element.dart';
import '../../models/user_model.dart';

class ReelDetail extends StatefulWidget {
  const ReelDetail({super.key, required this.reel});

  final PostModel reel;

  @override
  State<ReelDetail> createState() => _ReelDetailState();
}

class _ReelDetailState extends State<ReelDetail> {
  @override
  Widget build(BuildContext context) {
    UserModel user =
        userList.where((element) => element.id == widget.reel.userIdFK).single;

    return Container(
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            horizontalTitleGap: 12,
            title: Text(
              "${user.name} - Follow",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            ),
            leading: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage("${user.image}"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ExpandableText(
              '${widget.reel.caption}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.5,
                  color: Colors.white),
              expandText: 'more',
              collapseText: 'less',
              expandOnTextTap: true,
              collapseOnTextTap: true,
              maxLines: 1,
              linkColor: Colors.grey,
            ),
          ),
          ListTile(
            dense: true,
            minLeadingWidth: 0,
            horizontalTitleGap: 5,
            title: widget.reel.isTagged
                ? Row(
                    children: [
                      Container(
                        height: 20,
                        width: 125,
                        child: Marquee(
                          text:
                              "${widget.reel.audioTitle} - origional music - ",
                          scrollAxis: Axis.horizontal,
                          velocity: 20,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Icon(
                          Icons.person_outline_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
                    ],
                  )
                : Text(
                    "${widget.reel.audioTitle} - origional music",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
            leading: Icon(
              Icons.graphic_eq_outlined,
              size: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
