import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';
import 'package:personal_notes_app/src/presentation/app_state.dart';
import 'package:personal_notes_app/src/presentation/ui/note_creation/note_creation_page.dart';
import 'package:personal_notes_app/src/presentation/utils/Colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appCubit =  context.read<AppCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
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
        valueListenable: Hive.box<Note>('notes').listenable(),
        builder: (context, box, _) {
          if (box.values.isEmpty) {
            return Center(
                child: Text(
              'No notes yet!',
              style: TextStyle(color: MyColors.blackText),
            )); // Centered the text for better UI
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              final note = box.getAt(index);
              return ListTile(
                title: Text(note?.title ?? ""),
                subtitle: Text(
                    '${note?.content.substring(0, note.content.length > 50 ? 50 : note.content.length)}... \nCreated on: ${note?.creationDate}',
                    style: TextStyle(color: MyColors.blackText)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the note creation/editing page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteCreationPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
