import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  // Es para crear una película de cualquier fuente de datos
  static Movie movieDBtoEntity(MovieMovieDB movieMovieDB) => Movie(
      adult: movieMovieDB.adult,
      backdropPath: (movieMovieDB.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieMovieDB.backdropPath}'
          : 'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
      genreIds: movieMovieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieMovieDB.id,
      originalLanguage: movieMovieDB.originalLanguage,
      originalTitle: movieMovieDB.originalTitle,
      overview: movieMovieDB.overview,
      popularity: movieMovieDB.popularity,
      posterPath: (movieMovieDB.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieMovieDB.posterPath}'
          : 'no-poster-path',
      releaseDate: movieMovieDB.releaseDate,
      title: movieMovieDB.title,
      video: movieMovieDB.video,
      voteAverage: movieMovieDB.voteAverage,
      voteCount: movieMovieDB.voteCount);
}
