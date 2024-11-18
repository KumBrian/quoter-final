// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_quote.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuoteHiveAdapter extends TypeAdapter<QuoteHive> {
  @override
  final int typeId = 0;

  @override
  QuoteHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuoteHive(
      id: fields[0] as int,
      author: fields[1] as String,
      quote: fields[2] as String,
      isLiked: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, QuoteHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.quote)
      ..writeByte(3)
      ..write(obj.isLiked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuoteHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
