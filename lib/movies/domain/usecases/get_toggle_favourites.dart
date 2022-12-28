
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/faliure.dart';
import '../../../core/usecase/base_useCase.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetToggleFavouritesUseCase extends BaseUseCase<List<Movie?>,ToggleFavouritesParameters>  {
  final BaseMovieRepository repositories;

  GetToggleFavouritesUseCase(this.repositories);

  Future<Either<Failure, List<Movie?>>> call(ToggleFavouritesParameters parameters) async {
    return await repositories.toggleFavourites(parameters);
  }
}
class ToggleFavouritesParameters extends Equatable {
  final Movie favProduct;

  const ToggleFavouritesParameters({required this.favProduct});

  @override
  List<Object> get props => [favProduct];
}