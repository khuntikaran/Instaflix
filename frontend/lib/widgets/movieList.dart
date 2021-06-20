import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaflix/controller/movieController.dart';
import 'package:instaflix/screens/movieDetail.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    return Obx(
      () => ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: width * 0.03,
        ),
        itemCount: movieController.movieList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Get.to(MovieDetail(),
              transition: Transition.downToUp,
              arguments: movieController.movieList[index].id),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(
              () => movieController.isLoading.value
                  ? CircularProgressIndicator()
                  : Container(
                      margin: EdgeInsets.only(left: 15),
                      height: height * 0.3,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                movieController.movieList[index].image)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(5, 15),
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 3,
                            spreadRadius: -13,
                          ),
                          BoxShadow(
                            offset: Offset(-5, -1),
                            //   color: Colors.orange.shade500,
                            blurRadius: 3,
                            spreadRadius: -15,
                          ),
                        ],
                        //border: Border.all(width: 2, color: Colors.orange.shade800),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                child: Container(
                                  alignment: Alignment.center,
                                  //   margin: EdgeInsets.only(left: 15),
                                  width: width * 0.45,
                                  height: height * 0.08,

                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      movieController.movieList[index].name,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16 * scaleFactor,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
