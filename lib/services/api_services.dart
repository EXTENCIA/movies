import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String apiKey = 'bd3aee4538a37f6d666a8be213cff609';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final response =
        await http.get(Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey"));

    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

  Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final response = await http
        .get(Uri.parse("$baseUrl/trending/movie/week?api_key=$apiKey"));

    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

  Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final response =
        await http.get(Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"));

    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

  Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    final response = await http
        .get(Uri.parse("$baseUrl/search/movies?query=$query&api_key=$apiKey"));

    final data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }
}
