import 'package:finalapp/models/post_model.dart';
import 'package:finalapp/pages/logics/post_logic.dart';
import 'package:flutter/material.dart';
import '../widgets/list_item_widget.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
          Text(
            "Notifications",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
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
        _buildListView,
      ],
    );
  }

  Widget get _buildListView {

    List<PostModel> favoriteList = context.watch<PostLogic>().favoriteList;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: favoriteList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListItemWidget(
          item: favoriteList[index],
        );
      },
    );
  }
}
