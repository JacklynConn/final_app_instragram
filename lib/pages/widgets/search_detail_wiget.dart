import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../elements/post_list_element.dart';
import '../../models/post_model.dart';
import '../logics/post_logic.dart';
import 'list_item_widget.dart';

class SearchDetailWiget extends StatefulWidget {
  const SearchDetailWiget({super.key});

  @override
  State<SearchDetailWiget> createState() => _SearchDetailWigetState();
}

class _SearchDetailWigetState extends State<SearchDetailWiget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      title: const Row(
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
      physics: const NeverScrollableScrollPhysics(),
      itemCount: postList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListItemWidget(
          item: favoriteList[index],
        );
      },
    );
  }
}
