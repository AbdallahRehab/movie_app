
import '../../../core/error/exceptions.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/utills/app_constance.dart';
import '../../../core/utills/local_storage.dart';
import '../../domain/usecases/get_is_favourites.dart';
import '../../domain/usecases/get_toggle_favourites.dart';
import '../models/movie_model.dart';


abstract class ShowLocaleDataSource {
  /// get all the Favourites from db
  Future<List<MovieModel?>> getAllFavourites();

  Future<void> saveFavourites();

  Future<List<MovieModel?>> toggleFavourites(ToggleFavouritesParameters parameters);

  Future<bool> isFavourites(IsFavouritesParameters parameters);
}

class ShowLocaleDataSourceImpl implements ShowLocaleDataSource {
  var _favList = <MovieModel?>[];
  final _storage = LocalStorageService();

  List<MovieModel?> get favList => _favList;

  @override
  Future<List<MovieModel?>> getAllFavourites() async {
    final list = await _storage.getFromLocal(LocalStorageKey.favouritesKey);
    if (list != null) {
      _favList = List.from(
        (list as List).map((i) => MovieModel.fromJson(i)),
      );
      return favList;
    }
    throw DatabaseException(errorMassageModel: ErrorMassageModel(statusCode: 400,statusMessage: "Faliaur",success: false));
  }

  @override
  Future<void> saveFavourites() async {
    await _storage.saveToLocal(
      LocalStorageKey.favouritesKey,
      favList.map((i) => i?.toJson()).toList(),
    );
  }

  @override
  Future<List<MovieModel?>> toggleFavourites(ToggleFavouritesParameters parameters) async {
    try {
      var item = _favList.firstWhere((element) => element!.id == parameters.favProduct.id,
          orElse: () => null);

      if (item != null) {
        _favList.removeWhere((i) => i!.id == parameters.favProduct.id);
      } else {
        _favList.add(MovieModel.fromJson(MovieModel().toJsonShow(parameters.favProduct)));
      }
      await saveFavourites();
      await getAllFavourites();
      return favList;
    } catch (e) {
      throw DatabaseException(errorMassageModel: ErrorMassageModel(statusCode: 400,statusMessage: "Faliaur",success: false));
    }
  }

  @override
  Future<bool> isFavourites(IsFavouritesParameters parameters) async {
    try {
      var item = _favList.firstWhere((element) => element!.id == parameters.favProduct.id,
          orElse: () => null);
      return (item != null);
    } catch (e) {
      throw DatabaseException(errorMassageModel: ErrorMassageModel(statusCode: 400,statusMessage: "Faliaur",success: false));
    }
  }
}
