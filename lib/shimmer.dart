import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ShimmerLoad extends StatelessWidget {
  const ShimmerLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        mainAxisSpacing: 6.5,
        itemCount: 10,
        crossAxisCount: 2,
        crossAxisSpacing: 6.4,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Container(
          height: index.isEven?200:300,
          width: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color.fromARGB(255, 38, 38, 48),Color.fromARGB(255, 48, 48, 67)],begin: Alignment.topLeft,end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        
      ),
    );
  }
}
