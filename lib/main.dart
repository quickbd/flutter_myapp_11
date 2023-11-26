import 'package:flutter/material.dart';
import 'package:myapp_11/Screens/note_screen.dart';
import 'package:myapp_11/Models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox('notes');
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({Key?key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: StorageUtils.isFirstTimeLogin()? LoginPage() : HomePage()
       home: NoteScreen()
     );
   }
 }
 