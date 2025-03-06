import 'package:pilem/models/movie.dart';
import 'package:pilem/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Movie> _favoriteMovies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: ListView.builder(
          itemCount: _favoriteMovies.length,
          itemBuilder: (context, index) {
            final Movie movie = _favoriteMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                leading: Image.network(
                  movie.posterPath.trim() != ''
                      ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                      : 'https://placehold.co/60x40?text=No+Image',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(movie.title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(movie: movie),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
