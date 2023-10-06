import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';
import 'package:personal_notes_app/src/presentation/app_state.dart';
import 'package:personal_notes_app/src/presentation/ui/note_creation/note_creation_page.dart';
import 'package:personal_notes_app/src/presentation/widgets/note_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key); // Corrected constructor

  void _navigateToNoteCreationPage(BuildContext context) {
    //  method for navigation
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NoteCreationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();

    final notesBox = Hive.box<Note>('notes'); // Error handling

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.brightness_2,
            ),
            onPressed: () => appCubit.changeMode(),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<Note>>(
        valueListenable: notesBox.listenable(),
        builder: (context, box, _) {
          if (box.values.isEmpty) {
            return const Center(
                child: Text(
              'No notes yet!',
            )); // Centered the text for better UI
          }
          return ListView.separated(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              final note = box.getAt(index);
              return NoteListItem(note);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
                thickness: 1.0,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToNoteCreationPage(context), // Updated onPressed
        child: const Icon(Icons.add),
      ),
    );
  }
}
