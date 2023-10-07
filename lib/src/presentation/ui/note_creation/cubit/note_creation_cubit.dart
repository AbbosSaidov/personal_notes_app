import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';
import 'note_creation_state.dart';

class NoteCreationCubit extends Cubit<NoteCreationState> {
  NoteCreationCubit() : super(NoteCreationState(title: '', content: '', date: DateTime.now()));

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void saveNote(BuildContext context) async {
    try {
      final newNote = Note(
        titleController.text,
        contentController.text,
        state.date,
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
}
