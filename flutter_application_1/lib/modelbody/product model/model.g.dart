// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KidsModelAdapter extends TypeAdapter<KidsModel> {
  @override
  final int typeId = 0;

  @override
  KidsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KidsModel(
      name: fields[0] as String?,
      price: fields[1] as String?,
      discription: fields[2] as String?,
      category: fields[3] as String?,
      color: fields[4] as String?,
      size: fields[5] as String?,
      image: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, KidsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.discription)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.size)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KidsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
