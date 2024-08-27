import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalapp/elements/myprofile_list_element.dart';
import 'package:finalapp/elements/user_list_element.dart';
import 'package:finalapp/models/myprofile_model.dart';
import 'package:finalapp/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../logics/login_logic.dart';
import '../login_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName = "";

  @override
  Widget build(BuildContext context) {
    fullName =
        context.select<LoginLogic, String>((loginLogic) => loginLogic.fullName);
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      endDrawer: Drawer(
        child: ListView(
          children: [
            const ListTile(
              title: Text("Setting"),
            ),
            const ListTile(
              title: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Text(
            fullName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
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
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.at),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.plus_app, size: 30),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.logout,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget get _buildBody {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: myprofileList.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildDetailFollow(
          myprofileList[index],
        );
      },
    );
  }

  Widget _buildDetailFollow(MyProfileModel item) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: item.image,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
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
                  ),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${item.post}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Posts")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${item.followers}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Follows")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${item.following}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Following")
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          height: 35,
          // color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.only(right: 3),
                  width: 150,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Text(
                      "Edit profile",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.only(left: 2),
                  width: 150,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Text(
                      "Share profile",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  width: 150,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.userPlus,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          width: double.infinity,
          height: 25,
          // color: Colors.yellow,
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover people",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          height: 220,
          // color: Colors.grey,
          child: ListView.builder(
            itemCount: userList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _buildDiscoverPeople(userList[index]);
            },
          ),
        ),
        _buildTabBarView(),
      ],
    );
  }

  Widget _buildDiscoverPeople(UserModel userModel) {
    return Stack(
      children: [
        SizedBox(
          width: 150,
          height: 220,
          child: Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: userModel.image,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.colorBurn),
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    userModel.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const Text(
                  "Follow by",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // follow button
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 120,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Follow",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 15,
          right: 15,
          child: Icon(
            Icons.close,
            size: 20,
          ),
        ),
      ],
    );
  }

  // buildTabBarView
  Widget _buildTabBarView() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelColor: Colors.blueAccent,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Colors.blueAccent,
            automaticIndicatorColorAdjustment: true,
            dividerColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.grid_on_outlined),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.video),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              child: TabBarView(
                children: [
                  _buildGridView,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildGridView {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: userList.length,
      itemBuilder: (BuildContext context, int index) {
        return myProfileListElement(
          item: userList[index],
        );
      },
    );
  }

  Widget myProfileListElement({required UserModel item}) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(item.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
