part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  final List<Recommendation> recommendation;
  final RequestState recommendationMovieState;
  final String recommendationMessage;

  const MovieDetailsState(
      {this.movieDetail,
      this.movieDetailsState = RequestState.loading,
      this.movieDetailsMessage = "",
      this.recommendation = const [],
      this.recommendationMovieState = RequestState.loading,
      this.recommendationMessage = ""});

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationMovieState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationMovieState:
          recommendationMovieState ?? this.recommendationMovieState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationMovieState,
        recommendationMessage,
      ];
}
