import 'package:flutter/material.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';
import 'package:personal_notes_app/src/presentation/ui/note_view/note_view_page.dart';
import 'package:personal_notes_app/src/presentation/utils/text_helpers.dart';

class NoteListItem extends StatelessWidget {
  final Note? note;
  const NoteListItem(this.note, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (note != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteViewPage(note: note!)),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note?.title ?? "",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              '${truncateString(note?.content, 50)}... \nCreated on: ${note?.creationDate}',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
