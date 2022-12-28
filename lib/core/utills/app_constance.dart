class AppConstance{
  static const baseUrl="https://api.themoviedb.org/3/";
  static const String baseImageUrl="https://image.tmdb.org/t/p/w500";
  // static const apiKey="c343cfe40aeb079689227d82bf921d3";
  static const apiKey="9e1344955c25133be6513c9940fa4d8f";

  static String imageUrl(String path) => '$baseImageUrl$path';
}

class LocalStorageKey {
  static const String app = 'store';
  static const String favouritesKey = 'favourites_key';
}