import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../core/error/faliure.dart';
import '../repository/base_movie_repository.dart';

class GetIsFavouritesUseCase extends BaseUseCase<bool,IsFavouritesParameters>  {
  final BaseMovieRepository repositories;

  GetIsFavouritesUseCase(this.repositories);

  @override
  Future<Either<Failure, bool>> call(IsFavouritesParameters parameters) async {
    return await repositories.isFavourites(parameters);
  }
}
class IsFavouritesParameters extends Equatable {
  final Movie favProduct;

  const IsFavouritesParameters({required this.favProduct});

  @override
  List<Object> get props => [favProduct];
}