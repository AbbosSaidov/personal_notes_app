import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'note_model.g.dart'; // Name of the generated file

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final DateTime creationDate;

  Note(this.title, this.content, this.creationDate);

  // Method to get the formatted date and time
  String get formattedDateTime {
    return DateFormat.yMMMd().add_jm().format(creationDate);
  }
}
