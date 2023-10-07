import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';

import 'note_view_state.dart';

class NoteViewCubit extends Cubit<NoteViewState> {
  final Note note;
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  NoteViewCubit(this.note)
      : super(NoteViewState(
    title: note.title,
    content: note.content,
    date: note.creationDate,
    originalNote: note,
  )) {
    titleController.text = note.title;
    contentController.text = note.content;
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: state.date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != state.date) {
      updateDate(picked);
    }
  }

  void updateDate(DateTime date) {
    emit(state.copyWith(date: date));
  }

  void updateTitle() {
    emit(state.copyWith(title: titleController.text));
  }

  void updateContent() {
    emit(state.copyWith(content: contentController.text));
  }

  void updateNote(BuildContext context) async {
    final updatedNote = Note(
      titleController.text,
      contentController.text,
      state.date,
    );
    final notesBox = await Hive.openBox<Note>('notes');
    final noteIndex = notesBox.values.toList().indexOf(state.originalNote);
    if (noteIndex != -1) {
      await notesBox.putAt(noteIndex, updatedNote);
      Navigator.pop(context, updatedNote); // Optionally return the updated note
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note not found')),
      );
    }
  }

  void deleteNote(BuildContext context) async {
    final notesBox = await Hive.openBox<Note>('notes');
    final noteIndex = notesBox.values.toList().indexOf(state.originalNote);
    if (noteIndex != -1) {
      await notesBox.deleteAt(noteIndex);
      Navigator.pop(context); // Go back after deletion
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note not found')),
      );
    }
  }
}
