import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalapp/elements/user_list_element.dart';
import 'package:finalapp/models/post_model.dart';
import 'package:finalapp/models/user_model.dart';
import 'package:finalapp/pages/logics/post_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListItemWidget extends StatefulWidget {

  final PostModel item;
  ListItemWidget({required this.item});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          _buildRowProfile,
          _buildRowPicture,
          _buildRowComment,
          _buildRowLike,
          _buildRowCaption,
        ],
      ),
    );
  }

  Widget get _buildRowProfile {
    UserModel user =
        userList.where((element) => element.id == widget.item.userIdFK).single;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: user.image,
              imageBuilder: (context, imageProvider) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 33,
                        height: 33,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.yellow, Colors.purple],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            border:
                                Border.all(color: Colors.white, width: 2)),
                      ),
                    ],
                  ),
                );
              },
              placeholder: (context, url) => Container(
                color: Colors.grey[50],
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[200],
              ),
            ),
            SizedBox(
              width: 200,
              child: Text(
                user.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }

  Widget get _buildRowPicture {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: widget.item.image,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[50],
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[200],
        ),
      ),
    );
  }

  Widget get _buildRowComment {
    bool isFavorite = context.watch<PostLogic>().isFavorite(widget.item);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (isFavorite) {
                    context.read<PostLogic>().removePostFromFavorite(widget.item);
                  } else {
                    context.read<PostLogic>().addPostToFavorite(widget.item);
                  }
                },
                icon: isFavorite
                    ? Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red,
                      )
                    : Icon(CupertinoIcons.heart),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.chat_bubble),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.paperPlane),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark))
        ],
      ),
    );
  }

  Widget get _buildRowLike {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerLeft,
      child: Text("${widget.item.likeCount} Likes"),
    );
  }

  Widget get _buildRowCaption {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      alignment: Alignment.centerLeft,
      child: Text("${widget.item.caption}"),
    );
  }
}
