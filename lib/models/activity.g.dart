// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityAdapter extends TypeAdapter<Activity> {
  @override
  final int typeId = 0;

  @override
  Activity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Activity(
      date: fields[0] as String,
      meditation: fields[1] as bool,
      pomodoro: fields[2] as bool,
      exercise: fields[3] as bool,
      review: fields[4] as bool,
      rating: fields[5] as String,
      note: fields[6] as String,
      medStreak: fields[7] as int,
      pomStreak: fields[8] as int,
      exStreak: fields[9] as int,
      revStreak: fields[10] as int,
      activities: (fields[11] as List).cast<Activity>(),
    );
  }

  @override
  void write(BinaryWriter writer, Activity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.meditation)
      ..writeByte(2)
      ..write(obj.pomodoro)
      ..writeByte(3)
      ..write(obj.exercise)
      ..writeByte(4)
      ..write(obj.review)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.note)
      ..writeByte(7)
      ..write(obj.medStreak)
      ..writeByte(8)
      ..write(obj.pomStreak)
      ..writeByte(9)
      ..write(obj.exStreak)
      ..writeByte(10)
      ..write(obj.revStreak)
      ..writeByte(11)
      ..write(obj.activities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
