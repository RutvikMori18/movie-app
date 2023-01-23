import 'dart:convert';

import '../../domain/entities/movie_detail_entity.dart';

/// adult : false
/// backdrop_path : "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg"
/// belongs_to_collection : null
/// budget : 63000000
/// genres : [{"id":18,"name":"Drama"}]
/// homepage : ""
/// id : 550
/// imdb_id : "tt0137523"
/// original_language : "en"
/// original_title : "Fight Club"
/// overview : "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."
/// popularity : 0.5
/// poster_path : null
/// production_companies : [{"id":508,"logo_path":"/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png","name":"Regency Enterprises","origin_country":"US"},{"id":711,"logo_path":null,"name":"Fox 2000 Pictures","origin_country":""},{"id":20555,"logo_path":null,"name":"Taurus Film","origin_country":""},{"id":54050,"logo_path":null,"name":"Linson Films","origin_country":""},{"id":54051,"logo_path":null,"name":"Atman Entertainment","origin_country":""},{"id":54052,"logo_path":null,"name":"Knickerbocker Films","origin_country":""},{"id":25,"logo_path":"/qZCc1lty5FzX30aOCVRBLzaVmcp.png","name":"20th Century Fox","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "1999-10-12"
/// revenue : 100853753
/// runtime : 139
/// spoken_languages : [{"iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "How much can you know about yourself if you've never been in a fight?"
/// title : "Fight Club"
/// video : false
/// vote_average : 7.8
/// vote_count : 3439

MovieDataModel movieDataModelFromJson(String str) =>
    MovieDataModel.fromJson(json.decode(str));
String movieDataModelToJson(MovieDataModel data) => json.encode(data.toJson());

class MovieDataModel extends MovieDetailEntity {
  MovieDataModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    required this.overview,
    this.popularity,
    required this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    required this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    required this.title,
    this.video,
    required this.voteAverage,
    this.voteCount,
  }) : super(
          id: id,
          title: title,
          overview: overview,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          posterPath: posterPath,
          backDropPath: backdropPath ?? '',
        );

  factory MovieDataModel.fromJson(Map<String, dynamic> map) {
    return MovieDataModel(
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
      id: map['id'] != null ? map['id'] as num : 0.0,
      imdbId: map['imdbId'] != null ? map['imdbId'] as String : null,
      originalLanguage: map['originalLanguage'] != null
          ? map['originalLanguage'] as String
          : null,
      originalTitle:
          map['originalTitle'] != null ? map['originalTitle'] as String : null,
      overview: map['overview'] != null ? map['overview'] as String : '',
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
          map['releaseDate'] != null ? map['releaseDate'] as String : '',
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
      title: map['title'] != null ? map['title'] as String : '',
      video: map['video'] != null ? map['video'] as bool : null,
      voteAverage: map['voteAverage'] != null ? map['voteAverage'] as num : 0.0,
      voteCount: map['voteCount'] != null ? map['voteCount'] as num : null,
    );
  }
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  num? budget;
  List<Genres>? genres;
  String? homepage;
  num id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String overview;
  num? popularity;
  String posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String title;
  bool? video;

  num voteAverage;
  num? voteCount;
  MovieDataModel copyWith({
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
  }) =>
      MovieDataModel(
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
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] =
          productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}

/// iso_639_1 : "en"
/// name : "English"

SpokenLanguages spokenLanguagesFromJson(String str) =>
    SpokenLanguages.fromJson(json.decode(str));
String spokenLanguagesToJson(SpokenLanguages data) =>
    json.encode(data.toJson());

class SpokenLanguages {
  SpokenLanguages({
    this.iso6391,
    this.name,
  });

  SpokenLanguages.fromJson(dynamic json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
  String? iso6391;
  String? name;
  SpokenLanguages copyWith({
    String? iso6391,
    String? name,
  }) =>
      SpokenLanguages(
        iso6391: iso6391 ?? this.iso6391,
        name: name ?? this.name,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }
}

/// iso_3166_1 : "US"
/// name : "United States of America"

ProductionCountries productionCountriesFromJson(String str) =>
    ProductionCountries.fromJson(json.decode(str));
String productionCountriesToJson(ProductionCountries data) =>
    json.encode(data.toJson());

class ProductionCountries {
  ProductionCountries({
    this.iso31661,
    this.name,
  });

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
  String? iso31661;
  String? name;
  ProductionCountries copyWith({
    String? iso31661,
    String? name,
  }) =>
      ProductionCountries(
        iso31661: iso31661 ?? this.iso31661,
        name: name ?? this.name,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }
}

/// id : 508
/// logo_path : "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png"
/// name : "Regency Enterprises"
/// origin_country : "US"

ProductionCompanies productionCompaniesFromJson(String str) =>
    ProductionCompanies.fromJson(json.decode(str));
String productionCompaniesToJson(ProductionCompanies data) =>
    json.encode(data.toJson());

class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  num? id;
  String? logoPath;
  String? name;
  String? originCountry;
  ProductionCompanies copyWith({
    num? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) =>
      ProductionCompanies(
        id: id ?? this.id,
        logoPath: logoPath ?? this.logoPath,
        name: name ?? this.name,
        originCountry: originCountry ?? this.originCountry,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }
}

/// id : 18
/// name : "Drama"

Genres genresFromJson(String str) => Genres.fromJson(json.decode(str));
String genresToJson(Genres data) => json.encode(data.toJson());

class Genres {
  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
  Genres copyWith({
    num? id,
    String? name,
  }) =>
      Genres(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
