import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalapp/elements/myprofile_list_element.dart';
import 'package:finalapp/elements/user_list_element.dart';
import 'package:finalapp/models/myprofile_model.dart';
import 'package:finalapp/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      title: Row(
        children: [
          const Text("makmachksp", style: TextStyle(fontWeight: FontWeight.bold)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_down_rounded)),
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
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget get _buildBody {
    return ListView.builder(
      itemCount: myprofileList.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildDetailFollow(myprofileList[index]);
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
                                image: imageProvider, fit: BoxFit.cover),
                            border:
                                Border.all(color: Colors.white, width: 2),
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
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${item.post}",
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("Posts")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${item.followers}",
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text("Follows")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${item.following}",
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  child: Container(
                    margin: EdgeInsets.only(right: 3),
                    width: 150,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Text(
                        "Edit profile",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  flex: 4),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 2),
                  width: 150,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Text(
                      "Share profile",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                flex: 4,
              ),
              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 4),
                    width: 150,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.userPlus,
                        size: 15,
                      ),
                    ),
                  ),
                  flex: 1),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          width: double.infinity,
          height: 25,
          // color: Colors.yellow,
          child: Column(
            children: [
              Container(
                child: Row(
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
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 250,
          // color: Colors.grey,
          child: ListView.builder(
            itemCount: userList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _buildDiscoverPeople(userList[index]);
            },
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.grid_on_sharp),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.ondemand_video_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.user),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 300,
          // color: Colors.red,
        ),
      ],
    );
  }

  Widget _buildDiscoverPeople(UserModel userModel) {
    return Container(
      child: Card(
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          width: 150,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(3),
                child: Icon(
                  CupertinoIcons.xmark,
                  size: 15,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  // height: 135,
                  // width: 125,
                  child: CachedNetworkImage(
                    imageUrl: "${userModel.image}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.white, BlendMode.colorBurn),
                        ),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    children: [
                      Text(
                        "${userModel.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        "Follow by",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2, top: 20),
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Text(
                            "Follow",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
