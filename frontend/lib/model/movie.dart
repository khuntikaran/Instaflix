// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<Movie> movieFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) =>
    json.encode(List<Movie>.from(data.map((x) => x.toJson())));

class Movie {
  Movie({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.director,
    required this.imdb,
    required this.stars,
    required this.duration,
    required this.category,
    required this.starimage,
  });

  String id;
  String name;
  String description;
  String image;
  String director;
  String imdb;
  List<String> stars;
  String duration;
  List<String> category;
  List<String> starimage;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        director: json["director"],
        imdb: json["imdb"],
        stars: List<String>.from(json["stars"].map((x) => x)),
        duration: json["duration"],
        category: List<String>.from(json["category"].map((x) => x)),
        starimage: List<String>.from(json["starimage"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "image": image,
        "director": director,
        "imdb": imdb,
        "stars": List<String>.from(stars.map((x) => x)),
        "duration": duration,
        "category": List<String>.from(category.map((x) => x)),
        "starimage": List<String>.from(starimage.map((x) => x)),
      };
}
