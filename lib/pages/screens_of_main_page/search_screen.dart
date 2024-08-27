import '/elements/post_list_element.dart';
import '/pages/widgets/search_wiget.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/sliver.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../widgets/custom_explore_appbar_wiget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CustomExploreAppBarSearchWiget(),
            SliverStaggeredGrid.countBuilder(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                crossAxisCount: 3,
                staggeredTileBuilder: (int index) {
                  int modedIndex = index % 20;
                  int cXCellCount = modedIndex == 11 ? 2 : 1;

                  double mXCellcount = 1;
                  if (modedIndex == 2 || modedIndex == 11) {
                    mXCellcount = 2;
                  }
                  return StaggeredTile.count(cXCellCount, mXCellcount);
                },
                itemBuilder: (BuildContext, int index) {
                  return SearchWiget(
                    post: postList[index],
                  );
                },
                itemCount: 10)
          ],
        ),
      ),
    );
  }
}
