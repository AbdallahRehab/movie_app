import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services_locator.dart';

import 'movies/domain/entities/movie.dart';
import 'movies/presentation/pages/movies_screen.dart';

void main() {
  // mainMovie movie =  const Movie(
  //   id: 1,
  //   title: "titel",
  //   backdropPath: "backdropPath",
  //   genreIds:  [0],
  //   overview: "overview",
  //   voteAverage: 1.0,
  // );
  //
  // Movie movie1 =  const Movie(
  //   id: 1,
  //   title: "titel",
  //   backdropPath: "backdropPath",
  //   genreIds:  [0],
  //   overview: "overview",
  //   voteAverage: 1.0,
  // );
  // print("----------------------------");
  // print(movie == movie1);
  // print(movie.hashCode);
  // print(movie1.hashCode);
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: const MoviesScreen(),
    );
  }
}
