import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalapp/elements/myprofile_list_element.dart';
import 'package:finalapp/models/myprofile_model.dart';
import 'package:finalapp/pages/screens_of_main_page/home_screen.dart';
import 'package:finalapp/pages/screens_of_main_page/post_screen.dart';
import 'package:finalapp/pages/screens_of_main_page/profile_screen.dart';
import 'package:finalapp/pages/screens_of_main_page/reels_screen.dart';
import 'package:finalapp/pages/screens_of_main_page/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
      bottomNavigationBar: _buildBottom,
    );
  }

  HomeScreen _homeScreen = HomeScreen();
  SearchScreen _searchScreen = SearchScreen();
  PostScreen _postScreen = PostScreen();
  ReelsScreen _reelsScreen = ReelsScreen();
  ProfileScreen _profileScreen = ProfileScreen();

  late List<Widget> _pageList = [
    _homeScreen,
    _searchScreen,
    _postScreen,
    _reelsScreen,
    _profileScreen
  ];

  Widget get _buildBody {
    return Container(
      alignment: Alignment.center,
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pageList,
      ),
    );
  }

  int _currentIndex = 0;
  PageController _pageController = PageController();
  Widget get _buildBottom {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black87,
      selectedItemColor: Colors.black,
      currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black87,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.search,
                color: Colors.black87,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.plus_app,
                color: Colors.black87,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ondemand_video_rounded,
                color: Colors.black87,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(icon: _buildProfile, label: ""),
        ]);
  }

  Widget get _buildProfile {
    return Container(
      height: 40,
      width: 40,
      // color: Colors.red,
      child: ListView.builder(
        itemCount: myprofileList.length,
        itemBuilder: (context, int index) {
          return _buildImageProfile(myprofileList[index]);
        },
      ),
    );
  }

  Widget _buildImageProfile(MyProfileModel item) {
    return CachedNetworkImage(
      imageUrl: "${item.image}",
      imageBuilder: (context, imageProvider) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: imageProvider, fit: BoxFit.cover),
              border: Border.all(color: Colors.white, width: 2),
            ),
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
