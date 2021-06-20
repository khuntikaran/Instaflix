import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import 'package:instaflix/controller/movieController.dart';
import 'package:instaflix/screens/movieDetail.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    MovieController movieController = Get.put(MovieController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width * 1,
          height: height * 1,
          color: Colors.black.withOpacity(0.85),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 35),
                width: width * 1,
                height: height * 0.1,
                //  color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Daily Collection For You!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: 'Schyler'),
                  ),
                ),
              ),
              Obx(
                () => Swiper(
                  loop: false,
                  index: 0,
                  itemCount: movieController.movieList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Get.to(MovieDetail(),
                        arguments: movieController.movieList[index].id,
                        transition: Transition.cupertinoDialog),
                    child: Container(
                      width: width * 0.8,
                      height: height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              movieController.movieList[index].image),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.8),
                        border: Border.all(
                          width: 2,
                          color: Colors.orange.shade800,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 15,
                                  sigmaY: 15,
                                ),
                                child: Container(
                                  width: width * 0.95,
                                  height: height * 0.12,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 15,
                                        bottom: 15,
                                        child: GetBuilder<MovieController>(
                                          builder: (v) => IconButton(
                                            onPressed: () {
                                              v.isLiked();
                                            },
                                            icon: v.isLike.value
                                                ? Icon(
                                                    (Icons
                                                        .favorite_outline_rounded),
                                                    size: 40,
                                                    color: Colors.red
                                                        .withOpacity(0.4),
                                                  )
                                                : Icon(
                                                    Icons.favorite_rounded,
                                                    size: 40,
                                                    color: Colors.red
                                                        .withOpacity(0.4),
                                                  ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 40,
                                        child: Obx(
                                          () => Container(
                                            alignment: Alignment.centerLeft,
                                            width: width * 0.7,
                                            height: height * 0.06,
                                            //  color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Text(
                                                movieController
                                                    .movieList[index].name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        child: Obx(
                                          () => Container(
                                            height: height * 0.04,
                                            width: width * 0.5,
                                            //  color: Colors.green,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'IMDB:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.white
                                                            .withOpacity(0.5)),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.03,
                                                  ),
                                                  Text(
                                                    movieController
                                                        .movieList[index].imdb,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.white
                                                            .withOpacity(0.5)),
                                                  ),
                                                ],
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
                        ],
                      ),
                    ),
                  ),

                  autoplay: false,
                  //  pagination: SwiperPagination(builder: SwiperPagination.fraction),
                  // control: SwiperControl(),
                  itemHeight: height * 0.7,
                  itemWidth: width * 0.95,
                  layout: SwiperLayout.TINDER,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
