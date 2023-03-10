class MovieEntity {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String? overview;

  MovieEntity(
      {required this.posterPath,
      required this.id,
      required this.backdropPath,
      required this.title,
      required this.voteAverage,
      required this.releaseDate,
      this.overview})
      : assert(id != null, 'Movie id must not be null');

  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
