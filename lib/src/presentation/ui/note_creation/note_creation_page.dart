import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';


class NoteCreationPage extends StatefulWidget {

  const NoteCreationPage({super.key});

  @override
  _NoteCreationPageState createState() => _NoteCreationPageState();
}

class _NoteCreationPageState extends State<NoteCreationPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  DateTime _selectedDate = DateTime.now();  // Default to today's date


  void _saveNote() async {  // Mark this method as async since I'll be performing async operations
    try {
      final newNote = Note(
        _titleController.text,
        _contentController.text,
        _selectedDate,
      );
      final notesBox = await Hive.openBox<Note>('notes');  // Await the opening of the box

      await notesBox.add(newNote);

      Navigator.pop(context);
    } catch (e) {
      // a snackbar here to notify the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save the note: $e')),
      );
    }
  }
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'New Note' ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text("Select Date"),
            ),
            const SizedBox(height: 20),
            Text(
              "Selected date: ${_selectedDate.toLocal()}",
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
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
