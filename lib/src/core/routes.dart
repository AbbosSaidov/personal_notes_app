import 'package:flutter/material.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';
import 'package:personal_notes_app/src/presentation/ui/note_creation/note_creation_page.dart';
import 'package:personal_notes_app/src/presentation/ui/note_view/note_view_page.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/create':
      return MaterialPageRoute(builder: (context) => const NoteCreationPage());
    case '/edit':
      final Note args = settings.arguments as Note;
      return MaterialPageRoute(builder: (context) => NoteViewPage(note: args));
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
}
