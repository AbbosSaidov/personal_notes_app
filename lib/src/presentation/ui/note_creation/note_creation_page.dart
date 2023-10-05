import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';

import '../../utils/Colors.dart';

class NoteCreationPage extends StatefulWidget {
  final Note? note;

  const NoteCreationPage({super.key, this.note});

  @override
  _NoteCreationPageState createState() => _NoteCreationPageState();
}

class _NoteCreationPageState extends State<NoteCreationPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  void _saveNote() async {  // Mark this method as async since I'll be performing async operations
    try {
      final newNote = Note(
        _titleController.text,
        _contentController.text,
        DateTime.now(),
      );
      final notesBox = await Hive.openBox<Note>('notes');  // Await the opening of the box

      if (widget.note == null) {
        // New Note
        await notesBox.add(newNote);  // Await the add operation
      } else {
        // Updating Existing Note
        final noteIndex = notesBox.values.toList().indexOf(widget.note!);
        if (noteIndex != -1) {  // Check if the noteIndex is valid
          await notesBox.putAt(noteIndex, newNote);  // Await the putAt operation
        } else {
          throw Exception('Note not found in the box');  // Throw an exception if noteIndex is invalid
        }
      }

      Navigator.pop(context);
    } catch (e) {
      // a snackbar here to notify the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save the note: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              style: TextStyle(color: MyColors.blackText),
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: TextStyle(color: MyColors.blackText),
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 10,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveNote,
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
