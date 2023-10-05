
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'as Service;
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_notes_app/src/data/models/note/note_model.dart';
import 'package:personal_notes_app/src/presentation/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());  // Register the Note adapter
  await Hive.openBox<Note>('notes');
  await Hive.openBox('settings');

  // Setup app orientation
  await Service.SystemChrome.setPreferredOrientations([
    Service.DeviceOrientation.portraitUp,
    Service.DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const App());
}