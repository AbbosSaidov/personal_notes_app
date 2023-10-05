
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'as Service;
import 'package:flutter/services.dart';
import 'package:personal_notes_app/src/presentation/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup app orientation
  await Service.SystemChrome.setPreferredOrientations([
    Service.DeviceOrientation.portraitUp,
    Service.DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const App());
}