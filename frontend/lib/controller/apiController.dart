import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:instaflix/model/movie.dart';

class ApiServices {
  static var client = http.Client();

  static Future<List<Movie>> fetchMovies() async {
    var response =
        await client.get(Uri.parse('http://192.168.142.152:5050/movies'));
    print(response.body);
    if (response.statusCode == 200) {
      print("all good");
    } else {
      print("error while fetching api");
    }
    var jsonString = response.body;
    print(jsonString);
    return movieFromJson(jsonString);
  }

  static Future fetchMoviee(String id) async {
    var response =
        await client.get(Uri.parse('http://10.0.2.2:5050/movie/$id'));
    if (response.statusCode == 200) {
      print('all good for movie.');
    } else {
      print('error while parsing api');
    }
    var jsonStrng = response.body;
    print(jsonStrng);
    return jsonStrng;
  }
}
