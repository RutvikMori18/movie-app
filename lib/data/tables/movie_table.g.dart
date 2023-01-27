// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieTableAdapter extends TypeAdapter<MovieTable> {
  @override
  final int typeId = 0;

  @override
  MovieTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieTable(
      title: fields[2] as String,
      posterPath: fields[3] as String,
      id: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieTable obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.posterPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
