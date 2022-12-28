import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

import '../../movies/data/datasource/show_locale_datasource.dart';
import '../../movies/domain/usecases/get_all_favourites.dart';
import '../../movies/domain/usecases/get_is_favourites.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_recommendation_usecase.dart';
import '../../movies/domain/usecases/get_toggle_favourites.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/favourites/favourites_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    sl.registerFactory(() => FavouritesBloc(
        getAllFavouritesUseCase: sl(),
        getIsFavouritesUseCase: sl(),
        getToggleFavouritesUseCase: sl()));

    /// Use cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetAllFavouritesUseCase(sl()));
    sl.registerLazySingleton(() => GetIsFavouritesUseCase(sl()));
    sl.registerLazySingleton(() => GetToggleFavouritesUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepository(sl(), sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    sl.registerLazySingleton<ShowLocaleDataSource>(
        () => ShowLocaleDataSourceImpl());
  }
}
