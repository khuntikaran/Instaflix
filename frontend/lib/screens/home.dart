import 'package:flutter/material.dart';
import 'package:instaflix/model/categoryModel.dart';

import 'package:instaflix/widgets/category.dart';
import 'package:instaflix/widgets/movieList.dart';
import 'package:card_swiper/card_swiper.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MovieController movieController = Get.put(MovieController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height * 1,
          width: width * 1,
          color: Colors.black.withOpacity(0.85),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Container(
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    height: height * 0.08,
                    width: width * 0.9,
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hii Maxwell!",
                          style: TextStyle(
                              fontSize: 25 * scaleFactor,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                        Container(
                          height: height * 0.3,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink,
                            border: Border.all(
                                width: 2, color: Colors.orange.shade800),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                //Swiper----------------------------------------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Container(
                  height: height * 0.25,
                  width: width * 1,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Swiper(
                    curve: Curves.easeInOutCubic,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: width * 1,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageList[index].image),
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5, 15),
                                  color: Colors.white.withOpacity(0.4),
                                  blurRadius: 10,
                                  spreadRadius: -19),
                            ],
                          ),
                        ),
                      );
                    },
                    //autoplay: true,

                    itemCount: imageList.length,
                    viewportFraction: 0.95,
                    scale: 0.85,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                // Category ------------------------------->>>>>>>>>>>>>>>>>>>>>
                Container(
                  //   margin: EdgeInsets.only(left: 10),
                  height: height * 0.06,
                  width: width * 1,
                  child: Category(),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  width: width * 0.9,
                  height: height * 0.04,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                            fontSize: 20 * scaleFactor,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.8)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See more',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  height: height * 0.33,
                  width: width * 1,
                  child: MovieList(),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  width: width * 0.9,
                  height: height * 0.04,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending',
                        style: TextStyle(
                            fontSize: 20 * scaleFactor,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.8)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See more',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.33,
                  width: width * 1,
                  child: MovieList(),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
