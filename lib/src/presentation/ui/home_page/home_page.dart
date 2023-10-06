import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';
import 'package:personal_notes_app/src/presentation/app_state.dart';
import 'package:personal_notes_app/src/presentation/ui/note_creation/note_creation_page.dart';
import 'package:personal_notes_app/src/presentation/ui/note_view/note_view_page.dart';
import 'package:personal_notes_app/src/presentation/utils/Colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key); // Corrected constructor

  void _navigateToNoteCreationPage(BuildContext context) {
    //  method for navigation
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NoteCreationPage()),
    );
  }

  String truncateString(String? text, int length) {
    //  method for string truncation
    if (text == null) return "";
    return text.length > length ? text.substring(0, length) : text;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appCubit = context.read<AppCubit>();

    final notesBox = Hive.box<Note>('notes'); // Error handling

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
        valueListenable: notesBox.listenable(),
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
              return InkWell(
                onTap: (){
                  if(note!=null){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  NoteViewPage(note: note!)),
                    );
                  }
                },
                child: ListTile(
                  title: Text(note?.title ?? ""),
                  subtitle: Text(
                      '${truncateString(note?.content, 50)}... \nCreated on: ${note?.creationDate}',
                      style: TextStyle(color: MyColors.blackText)),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            _navigateToNoteCreationPage(context), // Updated onPressed
        child: const Icon(Icons.add),
      ),
    );
  }
}
