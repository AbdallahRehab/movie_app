import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetAllFavouritesUseCase {
  final BaseMovieRepository repositories;

  GetAllFavouritesUseCase(this.repositories);

  Future<Either<Failure, List<Movie?>>> call() async {
    return await repositories.getAllFavourites();
  }
}
