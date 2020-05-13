import 'dart:convert';

import 'package:flutterbloclearingapp/config/const.dart';
import 'package:flutterbloclearingapp/model/homePage/Movie.dart';
import 'package:http/http.dart' as http;

class API{

  final http.Client _client = http.Client();
  static const String _url = 'https://api.themoviedb.org/3/search/movie?api_key=$api_key&query={1}';
  
  Future<List<Movie>> get(String query) async {
    List<Movie> list = [];
    
    await _client.get(Uri.parse(_url.replaceFirst("{1}", query)))
                 .then((res)=> res.body)
                 .then(json.decode)
                 .then((json) => json ["results"])
                 .then((movies) => movies.forEach((movie) => list.add(Movie.fromJson(movie))));
    return list;
  }

}