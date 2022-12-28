import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {

  MovieModel({
    int? id,
    String? title,
    String? backdropPath,
    List<int>? genreIds,
    String? overview,
    double? voteAverage,
    String? releaseDate,
  }) : super(
      id: id!,
      title: title!,
      backdropPath: backdropPath!,
      genreIds: genreIds!,
      overview: overview!,
      voteAverage: voteAverage!,
      releaseDate: releaseDate!,);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble());


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['vote_average'] = voteAverage;
    return data;
  }


  Map<String, dynamic> toJsonShow(Movie favProduct) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = favProduct.id;
    data['title'] = favProduct.title;
    data['backdrop_path'] = favProduct.backdropPath;
    data['genre_ids'] = favProduct.genreIds;
    data['overview'] = favProduct.overview;
    data['release_date'] = favProduct.releaseDate;
    data['vote_average'] = favProduct.voteAverage;
    return data;
  }
}
