import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';

import '../../domain/usecases/get_is_favourites.dart';
import '../../domain/usecases/get_movie_detail_usecase.dart';
import '../../domain/usecases/get_toggle_favourites.dart';
import '../datasource/show_locale_datasource.dart';

class MoviesRepository extends BaseMovieRepository {
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  final ShowLocaleDataSource localeDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource,this.localeDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRateMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMoviesDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie?>>> getAllFavourites() async {
    try {
      final localeFavourites = await localeDataSource.getAllFavourites();
      return Right(localeFavourites);
    } on DatabaseException {
      return Left(DatabaseFailure("Failure to data"));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavourites(
      IsFavouritesParameters parameters) async {
    try {
      final localeFavourites = await localeDataSource.isFavourites(parameters);
      return Right(localeFavourites);
    } on DatabaseException {
      return Left(DatabaseFailure('Failure to data'));
    }
  }

  @override
  Future<Either<Failure, List<Movie?>>> toggleFavourites(
      ToggleFavouritesParameters parameters) async {
    try {
      final localeFavourites =
      await localeDataSource.toggleFavourites(parameters);
      return Right(localeFavourites);
    } on DatabaseException {
      return Left(DatabaseFailure('Failure to data'));
    }
  }
}
