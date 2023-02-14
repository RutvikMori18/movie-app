import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final num id;
  final String title;
  final String overview;
  final String releaseDate;
  final num voteAverage;
  final String backDropPath;
  final String posterPath;

  const MovieDetailEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.backDropPath,
    required this.posterPath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
