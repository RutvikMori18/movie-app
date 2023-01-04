// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:movieapp/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final int id;
  final bool? video;
  final int? votCount;
  final double voteAverage;
  final String title;
  final String releaseDate;
  final String? originalLanguage;
  final String? originalTitle;
  final List<int>? genereIds;
  final String backdropPath;
  final bool? adult;
  final String? overview;
  final String posterPath;
  final double? popularity;
  final String? mediaType;
  MovieModel({
    required this.id,
    required this.video,
    required this.votCount,
    required this.voteAverage,
    required this.title,
    required this.releaseDate,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genereIds,
    required this.backdropPath,
    required this.adult,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.mediaType,
  }) : super(
            id: id,
            title: title,
            backdropPath: backdropPath,
            posterPath: posterPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            overview: overview!);

  MovieModel copyWith({
    int? id,
    bool? video,
    int? votCount,
    double? voteAverage,
    String? title,
    String? releaseDate,
    String? originalLanguage,
    String? originalTitle,
    String? backdropPath,
    bool? adult,
    String? overview,
    String? posterPath,
    double? popularity,
    String? mediaType,
  }) {
    return MovieModel(
      id: id ?? this.id,
      video: video ?? this.video,
      votCount: votCount ?? this.votCount,
      voteAverage: voteAverage ?? this.voteAverage,
      title: title ?? this.title,
      releaseDate: releaseDate ?? this.releaseDate,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      backdropPath: backdropPath ?? this.backdropPath,
      adult: adult ?? this.adult,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      popularity: popularity ?? this.popularity,
      mediaType: mediaType ?? this.mediaType,
      genereIds: [],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'video': video,
      'votCount': votCount,
      'voteAverage': voteAverage,
      'title': title,
      'releaseDate': releaseDate,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'backdropPath': backdropPath,
      'adult': adult,
      'overview': overview,
      'posterPath': posterPath,
      'popularity': popularity,
      'mediaType': mediaType,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? 0,
      video: map['video'],
      votCount: map['votCount'] ?? 0,
      voteAverage: map['voteAverage'] ?? 0.0,
      title: map['title'] ?? '',
      releaseDate: map['releaseDate'] ?? '',
      originalLanguage: map['originalLanguage'] ?? '',
      originalTitle: map['originalTitle'] ?? '',
      backdropPath: map['backdropPath'] ?? '',
      adult: map['adult'] ?? false,
      overview: map['overview'],
      posterPath: map['posterPath'] ?? '',
      popularity: map['popularity'] ?? 0.0,
      mediaType: map['mediaType'],
      genereIds: map['genereIds'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Results(id: $id, video: $video, votCount: $votCount, voteAverage: $voteAverage, title: $title, releaseDate: $releaseDate, originalLanguage: $originalLanguage, originalTitle: $originalTitle, backdropPath: $backdropPath, adult: $adult, overview: $overview, posterPath: $posterPath, popularity: $popularity, mediaType: $mediaType)';
  }

  @override
  bool operator ==(covariant MovieModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.video == video &&
        other.votCount == votCount &&
        other.voteAverage == voteAverage &&
        other.title == title &&
        other.releaseDate == releaseDate &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.backdropPath == backdropPath &&
        other.adult == adult &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.popularity == popularity &&
        other.mediaType == mediaType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        video.hashCode ^
        votCount.hashCode ^
        voteAverage.hashCode ^
        title.hashCode ^
        releaseDate.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        backdropPath.hashCode ^
        adult.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        popularity.hashCode ^
        mediaType.hashCode;
  }
}
