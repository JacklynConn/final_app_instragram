import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomExploreAppBarSearchWiget extends StatelessWidget {
  const CustomExploreAppBarSearchWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      centerTitle: false,
      elevation: 0,
      title: Container(
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: TextField(
          cursorColor: Colors.grey.shade500,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w500),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              size: 25,
              color: Colors.grey.shade500,
            ),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
