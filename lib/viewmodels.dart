import 'package:flutter/cupertino.dart';
import 'package:movies_app/movie.dart';
import 'package:movies_app/webservice.dart';

class MoviesListViewModel extends ChangeNotifier{
  List<MovieViewModel> movies = List<MovieViewModel>();

  Future<List<MovieViewModel>> fetchMovies(String keyword) async {
    final results = await Webservice().fetchMovies(keyword);
    this.movies = results.map((e) => MovieViewModel(movie: e)).toList();
    print(this.movies);
    notifyListeners();
    return this.movies;
  }

}

class MovieViewModel {
  final Movie movie;
  MovieViewModel({this.movie});

  String get title{
    return this.movie.title;
  }

  String get poster{
    return this.movie.poster;
  }
}