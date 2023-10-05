import 'package:flutter/material.dart';
import 'package:personal_notes_app/src/data/models/note_model.dart';

class HomePage extends StatelessWidget {
  final List<Note> notes = [
    Note('Note 1', 'This is the content of note 1', DateTime.now()),
    //...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(
              '${note.content.substring(0, note.content.length > 50 ? 50 : note.content.length)}... \nCreated on: ${note.creationDate}',
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the note creation/editing page
        //  Navigator.push(
        //    context,
        //    MaterialPageRoute(builder: (context) => NotePage()),
        //  );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}