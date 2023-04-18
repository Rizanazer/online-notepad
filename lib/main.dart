import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_note/mainpage.dart';

import 'firebase_options.dart';

void main() async {
  //initialize hive
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  await Hive.initFlutter();

  WidgetsFlutterBinding.ensureInitialized();
  final dir = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: mainpage());
  }
}
