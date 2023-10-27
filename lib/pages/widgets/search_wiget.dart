import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalapp/models/post_model.dart';
import 'package:flutter/material.dart';
import '../screens_of_main_page/search_detail.dart';

class SearchWiget extends StatelessWidget {
  const SearchWiget({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CachedNetworkImage(
          imageUrl: post.image,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.colorBurn),
              ),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDetail(item: post)));
          },
        ),
        Container(
          child: Container(
            child: IconButton(
              onPressed: () {
                GestureDetector(
                  onTap: () {},
                );
              },
              icon: Icon(Icons.collections_rounded),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
