import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<Genres> genres;
  final String overview;
  final double voteAverage;
  final int runtime;
  final String releaseDate;

  const MovieDetail(
      {required this.id,
      required this.title,
      required this.runtime,
      required this.backdropPath,
      required this.genres,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        genres,
        runtime,
        overview,
        voteAverage,
        releaseDate,
      ];
}
