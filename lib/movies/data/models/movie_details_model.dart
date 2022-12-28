import 'package:movies_app/movies/domain/entities/movie_detail.dart';

import 'genres_model.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel(
      {required super.id,
      required super.title,
      required super.runtime,
      required super.backdropPath,
      required super.genres,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          runtime: json["runtime"],
          id: json["id"],
          title: json["title"],
          backdropPath: json["backdrop_path"],
          genres: List<GenresModel>.from(
              json["genres"].map((x) => GenresModel.fromjson(x))),
          overview: json["overview"],
          releaseDate: json["release_date"],
          voteAverage: json["vote_average"].toDouble());
}
