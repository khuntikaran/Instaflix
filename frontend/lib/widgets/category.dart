import 'package:flutter/material.dart';
import 'package:instaflix/model/categoryModel.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);
  final List<Color> colors = [
    Colors.pink,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.purple.shade200,
    Colors.yellow.shade200,
    Colors.orange.shade200
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(
        width: width * 0.03,
      ),
      itemCount: categoryList.length,
      itemBuilder: (context, index) => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20),
        //  height: height * 0.3,
        width: width * 0.2,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: colors[index],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              categoryList[index].name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20 * scaleFactor,
                  color: Colors.white.withOpacity(0.85)),
            ),
          ),
        ),
      ),
    );
  }
}
