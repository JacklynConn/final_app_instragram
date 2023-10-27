import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalapp/elements/post_list_element.dart';
import 'package:finalapp/pages/screens_of_main_page/reel_detail.dart';
import 'package:finalapp/pages/screens_of_main_page/reel_side_action_bar.dart';
import 'package:flutter/material.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Text(
              "Reels",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt_outlined),
            color: Colors.white,
          )
        ],
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: postList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: CachedNetworkImage(
              imageUrl: "${postList[index].image}",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black12, BlendMode.colorBurn),
                  ),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent
                              ],
                              begin: Alignment(0, -0.75),
                              end: Alignment(0, 0.1)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent
                              ],
                              end: Alignment(0, -0.75),
                              begin: Alignment(0, 0.1)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Flexible(
                                flex: 14,
                                child: ReelDetail(
                                  reel: postList[index],
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: ReelSideActionBar(
                                  reel: postList[index],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}
