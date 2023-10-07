import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'cubit/note_creation_cubit.dart';
import 'cubit/note_creation_state.dart';

class NoteCreationPage extends StatelessWidget {
  const NoteCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCreationCubit(),
      child: const NoteCreationPageView(),
    );
  }
}

class NoteCreationPageView extends StatelessWidget {
  const NoteCreationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NoteCreationCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => bloc.selectDate(context),
              child: const Text("Select Date"),
            ),
            const SizedBox(height: 20),
            BlocBuilder<NoteCreationCubit, NoteCreationState>(
              buildWhen: (previousState, currentState) => previousState.date != currentState.date,
              builder: (context, state) {
                final formattedDate = DateFormat.yMMMd().format(state.date);  // Format the date
                return Text("Date: $formattedDate");
              },
            ),
            TextFormField(
              controller: bloc.titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (_) => bloc.updateTitle(),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: bloc.contentController,
              decoration: const InputDecoration(labelText: 'Content'),
              onChanged: (_) => bloc.updateContent(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => bloc.saveNote(context),
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
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
