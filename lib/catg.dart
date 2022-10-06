
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:wallove/wpscreen.dart';

// ignore: must_be_immutable
class CatagorieModel extends StatelessWidget {
  List item;
  CatagorieModel(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 12,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      physics: const ScrollPhysics(),
      itemCount: item.length,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) =>   GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WpScreen(
                          url: item[index]['urls']['full'],
                          name: item[index]['id'],
                          durl: item[index]['links']['download'])));
                },
                child: Container(
                  width: item[index]['width']*0.1,
                  height: item[index]['height']*0.05,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(item[index]['urls']['thumb']),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

    ));
  }
}
