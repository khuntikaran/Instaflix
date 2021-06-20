import 'dart:async';

import 'package:get/state_manager.dart';
import 'package:instaflix/controller/apiController.dart';
import 'package:instaflix/model/movie.dart';

class MovieController extends GetxController {
  //var movie;
  var movieList = <Movie>[].obs;
  var isLike = false.obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchMovie();

    super.onInit();
  }

  void fetchMovie() async {
    isLoading.value = true;

    var movies = await ApiServices.fetchMovies();
    isLoading.value = false;
    movieList.value = movies;
  }

  movieById(String id) {
    var movie = movieList.firstWhere((element) => element.id == id);
    return movie;
  }

  void isLiked() {
    if (isLike == RxBool(false)) {
      isLike = RxBool(true);
    } else if (isLike == RxBool(true)) {
      isLike = RxBool(false);
    }
    update();
  }
}
