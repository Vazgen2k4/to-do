// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoItemDataAdapter extends TypeAdapter<ToDoItemData> {
  @override
  final int typeId = 0;

  @override
  ToDoItemData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoItemData(
      title: fields[0] as String,
      toDo: fields[1] as String,
    )..date = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, ToDoItemData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.toDo)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoItemDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
