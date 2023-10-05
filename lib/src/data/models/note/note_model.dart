import 'package:hive/hive.dart';

part 'note_model.g.dart';  // Name of the generated file

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final DateTime creationDate;

  Note(this.title, this.content, this.creationDate);
}