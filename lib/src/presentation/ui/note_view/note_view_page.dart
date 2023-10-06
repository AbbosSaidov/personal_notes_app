import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';


class NoteViewPage extends StatefulWidget {
  final Note note;

  const NoteViewPage({Key? key, required this.note}) : super(key: key);

  @override
  _NoteViewPageState createState() => _NoteViewPageState();
}

class _NoteViewPageState extends State<NoteViewPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  DateTime? _selectedDate;
  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note.title;
    _contentController.text = widget.note.content;
    _selectedDate = widget.note.creationDate;
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _updateNote() async {
    final updatedNote = Note(
      _titleController.text,
      _contentController.text,
      _selectedDate?? DateTime.now(), // Keep the original creation date
    );

    final notesBox = await Hive.openBox<Note>('notes');
    final noteIndex = notesBox.values.toList().indexOf(widget.note);
    if (noteIndex != -1) {
      await notesBox.putAt(noteIndex, updatedNote);
      Navigator.pop(context, updatedNote); // Optionally return the updated note
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note not found')),
      );
    }
  }

  void _deleteNote() async {
    final notesBox = await Hive.openBox<Note>('notes');
    final noteIndex = notesBox.values.toList().indexOf(widget.note);
    if (noteIndex != -1) {
      await notesBox.deleteAt(noteIndex);
      Navigator.pop(context); // Go back after deletion
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note not found')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteNote,
          ),
        ],
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
              "Selected date: $_selectedDate",
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 20),
            Text(
              'Created on: ${widget.note.creationDate}',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _updateNote,
                  child: Text('Update'),
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
