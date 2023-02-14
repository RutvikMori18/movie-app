import 'package:movieapp/domain/entities/video_entity.dart';

class Results extends VideoEntity {
  Results({
    this.iso6391,
    this.iso31661,
    required this.name,
    required this.key,
    this.site,
    this.size,
    required this.type,
    this.official,
    this.publishedAt,
    this.id,
  }) : super(title: name, key: key, type: type);

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      iso6391: map['iso6391'] != null ? map['iso6391'] as String : null,
      iso31661: map['iso31661'] != null ? map['iso31661'] as String : null,
      name: map['name'] as String,
      key: map['key'] as String,
      site: map['site'] != null ? map['site'] as String : null,
      size: map['size'] != null ? map['size'] as int : null,
      type: map['type'] as String,
      official: map['official'] != null ? map['official'] as bool : null,
      publishedAt:
          map['publishedAt'] != null ? map['publishedAt'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }
  String? iso6391;
  String? iso31661;
  String name;
  String key;
  String? site;
  int? size;
  String type;
  bool? official;
  String? publishedAt;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_639_1'] = iso6391;
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    map['key'] = key;
    map['site'] = site;
    map['size'] = size;
    map['type'] = type;
    map['official'] = official;
    map['published_at'] = publishedAt;
    map['id'] = id;
    return map;
  }
}
