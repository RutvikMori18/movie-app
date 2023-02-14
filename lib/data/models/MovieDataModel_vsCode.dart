// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'movie_detail_model.dart';

class MovieDataModelVsCode {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  num? budget;
  List<Genres>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  dynamic posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
  MovieDataModelVsCode({
    this.adult,
    this.backdropPath,
    required this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    required this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieDataModelVsCode copyWith({
    bool? adult,
    String? backdropPath,
    dynamic belongsToCollection,
    num? budget,
    List<Genres>? genres,
    String? homepage,
    num? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    dynamic posterPath,
    List<ProductionCompanies>? productionCompanies,
    List<ProductionCountries>? productionCountries,
    String? releaseDate,
    num? revenue,
    num? runtime,
    List<SpokenLanguages>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
  }) {
    return MovieDataModelVsCode(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'belongsToCollection': belongsToCollection,
      'budget': budget,
      'genres': genres?.map((x) => x.toJson()).toList(),
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'productionCompanies':
          productionCompanies?.map((x) => x.toJson()).toList(),
      'productionCountries':
          productionCountries?.map((x) => x.toJson()).toList(),
      'releaseDate': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spokenLanguages': spokenLanguages?.map((x) => x.toJson()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory MovieDataModelVsCode.fromMap(Map<String, dynamic> map) {
    return MovieDataModelVsCode(
      adult: map['adult'] != null ? map['adult'] as bool : null,
      backdropPath:
          map['backdropPath'] != null ? map['backdropPath'] as String : null,
      belongsToCollection: map['belongsToCollection'] as dynamic,
      budget: map['budget'] != null ? map['budget'] as num : null,
      genres: map['genres'] != null
          ? List<Genres>.from(
              (map['genres'] as List<int>).map<Genres?>(
                (x) => Genres.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      homepage: map['homepage'] != null ? map['homepage'] as String : null,
      id: map['id'] != null ? map['id'] as num : null,
      imdbId: map['imdbId'] != null ? map['imdbId'] as String : null,
      originalLanguage: map['originalLanguage'] != null
          ? map['originalLanguage'] as String
          : null,
      originalTitle:
          map['originalTitle'] != null ? map['originalTitle'] as String : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      popularity: map['popularity'] != null ? map['popularity'] as num : null,
      posterPath: map['posterPath'] as dynamic,
      productionCompanies: map['productionCompanies'] != null
          ? List<ProductionCompanies>.from(
              (map['productionCompanies'] as List<int>)
                  .map<ProductionCompanies?>(
                (x) => ProductionCompanies.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      productionCountries: map['productionCountries'] != null
          ? List<ProductionCountries>.from(
              (map['productionCountries'] as List<int>)
                  .map<ProductionCountries?>(
                (x) => ProductionCountries.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      releaseDate:
          map['releaseDate'] != null ? map['releaseDate'] as String : null,
      revenue: map['revenue'] != null ? map['revenue'] as num : null,
      runtime: map['runtime'] != null ? map['runtime'] as num : null,
      spokenLanguages: map['spokenLanguages'] != null
          ? List<SpokenLanguages>.from(
              (map['spokenLanguages'] as List<int>).map<SpokenLanguages?>(
                (x) => SpokenLanguages.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      tagline: map['tagline'] != null ? map['tagline'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      video: map['video'] != null ? map['video'] as bool : null,
      voteAverage:
          map['voteAverage'] != null ? map['voteAverage'] as num : null,
      voteCount: map['voteCount'] != null ? map['voteCount'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDataModelVsCode.fromJson(String source) =>
      MovieDataModelVsCode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieDataModelVsCode(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(covariant MovieDataModelVsCode other) {
    if (identical(this, other)) return true;

    return other.adult == adult &&
        other.backdropPath == backdropPath &&
        other.belongsToCollection == belongsToCollection &&
        other.budget == budget &&
        listEquals(other.genres, genres) &&
        other.homepage == homepage &&
        other.id == id &&
        other.imdbId == imdbId &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        listEquals(other.productionCompanies, productionCompanies) &&
        listEquals(other.productionCountries, productionCountries) &&
        other.releaseDate == releaseDate &&
        other.revenue == revenue &&
        other.runtime == runtime &&
        listEquals(other.spokenLanguages, spokenLanguages) &&
        other.status == status &&
        other.tagline == tagline &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdropPath.hashCode ^
        belongsToCollection.hashCode ^
        budget.hashCode ^
        genres.hashCode ^
        homepage.hashCode ^
        id.hashCode ^
        imdbId.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        productionCompanies.hashCode ^
        productionCountries.hashCode ^
        releaseDate.hashCode ^
        revenue.hashCode ^
        runtime.hashCode ^
        spokenLanguages.hashCode ^
        status.hashCode ^
        tagline.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}
