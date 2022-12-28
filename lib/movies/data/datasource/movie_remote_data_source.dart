import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utills/app_constance.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRateMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        "${AppConstance.baseUrl}movie/now_playing?api_key=${AppConstance.apiKey}");

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {

    final response = await Dio().get(
        "${AppConstance.baseUrl}movie/popular?api_key=${AppConstance.apiKey}");

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRateMovies() async {
    final response = await Dio().get(
        "${AppConstance.baseUrl}movie/top_rated?api_key=${AppConstance.apiKey}");

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async{
    final response = await Dio().get(
        "${AppConstance.baseUrl}movie/${parameters.movieId}?api_key=${AppConstance.apiKey}");

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data );
    } else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async {
    final response = await Dio().get(
        "${AppConstance.baseUrl}movie/${parameters.id}/recommendations?api_key=${AppConstance.apiKey}");

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}
