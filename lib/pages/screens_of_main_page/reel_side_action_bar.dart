import 'package:finalapp/elements/post_list_element.dart';
import 'package:finalapp/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReelSideActionBar extends StatelessWidget {
  const ReelSideActionBar({Key? key, required this.reel}) : super(key: key);
  final PostModel reel;
  final double _iconSize = 28;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          // color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(reel.isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart),
                iconSize: _iconSize,
                  color: reel.isLiked ? Colors.red : Colors.white,
              ),
              Text(
                "${reel.likeCount}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              Text(
                "${reel.totalComments}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.paperPlane,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              Text(
                "${reel.totalshare}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "${reel.artistimage}")),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
