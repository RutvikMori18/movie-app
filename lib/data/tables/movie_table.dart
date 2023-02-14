import 'package:hive/hive.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String posterPath;
  MovieTable({required this.title, required this.posterPath, required this.id})
      : super(
          posterPath: posterPath,
          id:id,
          title: title,
          releaseDate: '',
          voteAverage: 0.0,
          backdropPath: '',
          overview: null,
        );

  factory MovieTable.fromMovieEntity(MovieEntity movieEntity) {
    return MovieTable(
        title: movieEntity.title,
        posterPath: movieEntity.posterPath,
        id: movieEntity.id);
  }
}
