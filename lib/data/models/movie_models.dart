// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'package:movieapp/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  }) : super(
            id: id,
            title: title,
            backdropPath: backdropPath,
            posterPath: posterPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            overview: overview!);

  final String posterPath;
  final bool? adult;
  final String? overview;
  final String releaseDate;
  final List<int?>? genreIds;
  final int id;
  final String? originalTitle;
  final OriginalLanguage? originalLanguage;
  final String title;
  final String backdropPath;
  final double? popularity;
  final int? voteCount;
  final bool? video;
  final double voteAverage;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        posterPath: json["poster_path"] ?? '',
        adult: json["adult"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int?>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        title: json["title"],
        backdropPath: json["backdrop_path"] ?? '',
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "adult": adult,
        "overview": overview,
        "release_date": releaseDate,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "original_language": originalLanguageValues.reverse![originalLanguage],
        "title": title,
        "backdrop_path": backdropPath,
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "vote_average": voteAverage,
      };
}

enum OriginalLanguage { EN }

final originalLanguageValues = EnumValues({"en": OriginalLanguage.EN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
