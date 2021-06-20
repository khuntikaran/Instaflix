import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaflix/controller/apiController.dart';
import 'package:instaflix/controller/movieController.dart';
import 'package:instaflix/model/movie.dart';
import 'package:instaflix/screens/home.dart';
import 'package:instaflix/screens/myhome.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  void _getBack() {
    Get.back();
    Get.snackbar('for backward', 'this is a message');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    final id = Get.arguments;
    MovieController movieController = Get.put(MovieController());
    Movie movie = movieController.movieById(id);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: height * 1,
              width: width * 1,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.9)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      height: height * 0.40,
                      width: width * 0.95,
                      //  color: Colors.amber,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(movie.image),
                        ),
                      ),
                      child: Stack(
                        children: [
                          LayoutBuilder(
                            builder: (context, BoxConstraints constraints) =>
                                Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              height: constraints.minHeight * 0.2,
                              width: constraints.maxWidth * 0.95,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.off(Home());
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.bookmark_outline_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 150,
                            left: 170,
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white.withOpacity(0.6),
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(left: 107),
                      height: height * 0.035,
                      width: width * 0.95,
                      child: ListTile(
                        title: Text(
                          movie.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 21 * scaleFactor,
                          ),
                        ),
                        subtitle: Text(
                          'Director: ${movie.director}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16 * scaleFactor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 60),
                      height: height * 0.025,
                      width: width * 0.77,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'IMDB: ${movie.imdb}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.8 * scaleFactor,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.1,
                            ),
                            Icon(
                              Icons.access_time_rounded,
                              color: Colors.white.withOpacity(0.3),
                              size: 21,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Text(
                                movie.duration,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16 * scaleFactor,
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      height: height * 0.04,
                      width: width * 0.3,
                      child: Text(
                        'StoryLine',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20 * scaleFactor,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      height: height * 0.16,
                      width: width * 0.82,
                      child: Text(
                        movie.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18 * scaleFactor,
                            color: Colors.white.withOpacity(0.6)),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 9),
                      height: height * 0.03,
                      width: width * 0.3,
                      child: Text(
                        'Cast:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 20 * scaleFactor),
                      ),
                    ),
                    Container(
                      width: width * 1,
                      height: height * 0.15,
                      //  color: Colors.pink.shade100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(
                          width: width * 0.03,
                        ),
                        itemCount: movie.stars.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 5, top: 5, right: 5),
                              width: width * 0.3,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    movie.starimage[index],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 5),
                              width: width * 0.35,
                              height: height * 0.025,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  movie.stars[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 290,
              left: 20,
              child: Container(
                width: width * 0.23,
                height: height * 0.17,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.image),
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber,
                ),
              ),
            ),
            Positioned(
              bottom: 180,
              right: 10,
              child: Container(
                width: width * 0.15,
                height: height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.snackbar('title', 'message');
                        Get.off(MyHome());
                      },
                      icon: Icon(
                        Icons.mode_comment_rounded,
                        size: 28,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share_rounded,
                        size: 30,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.download_rounded,
                        size: 33,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
