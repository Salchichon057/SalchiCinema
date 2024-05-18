// Haciendo un provider para el repositorio de películas ( solo lectura)
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Inmutable provider
final moviesRepositoryProvider = Provider((ref) {
  // Acá se podría cambiar la implementación a otro datasource
  return MovieRepositoryImpl(MoviedbDatasource());
});
