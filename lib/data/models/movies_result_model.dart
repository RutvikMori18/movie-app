// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:movieapp/data/models/movie_models.dart';

class MovieResultModel {
  List<MovieModel> results;
  MovieResultModel({
    required this.results,
  });

  MovieResultModel copyWith({
    List<MovieModel>? results,
  }) {
    return MovieResultModel(
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieResultModel.fromMap(Map<String, dynamic> map) {
    return MovieResultModel(
      results: List<MovieModel>.from(
        (map['results'] as List<dynamic>).map<MovieModel>(
          (x) => MovieModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieResultModel.fromJson(String source) =>
      MovieResultModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MovieData(results: $results)';

  @override
  bool operator ==(covariant MovieResultModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.results, results);
  }

  @override
  int get hashCode => results.hashCode;
}
