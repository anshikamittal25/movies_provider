import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart';

class Webservice{
  Future<List<Movie>> fetchMovies(String keyword) async{
    var url = 'http://www.omdbapi.com/?s=$keyword&apikey=edbc95f8';
    var response = await http.get(url);
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      print('----------');
      print(body);
      print('----------');
      final Iterable json=body["Search"];
      return json.map((e) => Movie.fromJson(e)).toList();
    }
    else {
      throw Exception("Unable to perform request!");
    }
  }
}