import 'package:flutter/material.dart';
import 'package:neymis/components/tile.dart';

class Grid extends StatelessWidget {
  const Grid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(38, 12, 38, 10),
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          crossAxisCount: 5,
        ), itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all()
        ),

        child: Tile(index: index,),
      );
    }
    );
  }
}
