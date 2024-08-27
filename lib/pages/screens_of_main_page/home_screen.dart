import 'package:finalapp/elements/post_list_element.dart';
import 'package:finalapp/elements/user_list_element.dart';
import 'package:finalapp/pages/logics/login_logic.dart';
import 'package:finalapp/pages/logics/post_logic.dart';
import 'package:finalapp/pages/screens_of_main_page/favorite_notification.dart';
import 'package:finalapp/pages/widgets/list_item_widget.dart';
import 'package:finalapp/pages/widgets/story_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    bool isFavoriteListEmpty = context.watch<PostLogic>().isFavoriteListEmpty();
    return AppBar(
      title: Row(
        children: [
          const Text(
            "Instagram",
            style: TextStyle(
              fontFamily: "Vegas",
              fontSize: 50,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FavoriteScreen(),
              ),
            );
          },
          icon: isFavoriteListEmpty
              ? const Icon(CupertinoIcons.heart)
              : const Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.facebookMessenger,
            size: 21,
          ),
        )
      ],
    );
  }

  Widget get _buildBody {
    return Container(
      alignment: Alignment.center,
      child: _buildMainListView,
    );
  }

  Widget get _buildMainListView {
    return ListView(
      children: [
        _buildStory,
        _buildListView,
      ],
    );
  }

  Widget get _buildListView {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: postList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListItemWidget(
          item: postList[index],
        );
      },
    );
  }

  Widget get _buildStory {
    return SizedBox(
      height: 120,
      // color: Colors.grey,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return StoryItemWidget(
            item: userList[index],
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
