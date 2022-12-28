import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_usecase.dart';

import '../../../core/error/faliure.dart';
import '../entities/movie_detail.dart';
import '../entities/recommendation.dart';
import '../usecases/get_is_favourites.dart';
import '../usecases/get_recommendation_usecase.dart';
import '../usecases/get_toggle_favourites.dart';

abstract class BaseMovieRepository{

  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies ();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMoviesDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters);

  Future<Either<Failure,List<Movie?>>> getAllFavourites();


  Future<Either<Failure,List<Movie?>>> toggleFavourites(ToggleFavouritesParameters parameters);


  Future<Either<Failure,bool>> isFavourites(IsFavouritesParameters parameters);
}