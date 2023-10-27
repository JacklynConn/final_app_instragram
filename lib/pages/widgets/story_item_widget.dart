import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalapp/models/user_model.dart';
import 'package:flutter/material.dart';

class StoryItemWidget extends StatelessWidget {
  final UserModel item;

  StoryItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPicture,
        _buildTextName,
      ],
    );
  }

  Widget get _buildTextName{
    return Container(
      width: 80,
      child: Text(
        item.name,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget get _buildPicture{
    return CachedNetworkImage(
      imageUrl: item.image,
      imageBuilder: (context, imageProvider) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.yellow, Colors.purple],
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover),
                  border: Border.all(color: Colors.white, width: 2),
                ),
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
    );
  }
}
