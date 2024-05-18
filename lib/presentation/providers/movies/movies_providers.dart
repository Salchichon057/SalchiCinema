import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchNowPlayingMovies = ref.watch(moviesRepositoryProvider).getNowPlaying;

  return MoviesNotifier(
    // Lo tenemos desde el provider de repositorio de películas
    fetchMoreMovies: fetchNowPlayingMovies
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});
// Un typedef es una forma de definir un tipo de función, 
// en este caso MovieCallback es una función que recibe un parámetro opcional 
// de tipo entero y devuelve un Future<List<Movie>>

class MoviesNotifier extends StateNotifier<List<Movie>> {
  // Es una clase para manejar el estado de la lista de películas (List<Movie>)
  int currentPage = 0;

  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies]; // Actualiza el estado con las películas obtenidas
  }
}
