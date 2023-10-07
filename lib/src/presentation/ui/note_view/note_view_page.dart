import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';

import 'cubit/note_view_cubit.dart';
import 'cubit/note_view_state.dart';

class NoteViewPage extends StatelessWidget {
  final Note note;

  const NoteViewPage({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteViewCubit(note),
      child: const NoteViewPageView(),
    );
  }
}

class NoteViewPageView extends StatelessWidget {
  const NoteViewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<NoteViewCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => cubit.deleteNote(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => cubit.selectDate(context),
              child: const Text("Select Date"),
            ),
            const SizedBox(height: 20),
            BlocBuilder<NoteViewCubit, NoteViewState>(
              buildWhen: (previousState, currentState) =>
                  previousState.date != currentState.date,
              builder: (context, state) {
                final formattedDate =
                    DateFormat.yMMMd().format(state.date); // Format the date
                return Text("Date: $formattedDate");
              },
            ),
            TextField(
              controller: cubit.titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (_) => cubit.updateTitle(),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: cubit.contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cubit.updateNote(context);
                  },
                  child: const Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
