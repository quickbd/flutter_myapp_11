import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp_11/pages/login.dart';
import 'package:myapp_11/storage_utils.dart';

import 'pages/home.dart';
import 'pages/registration.dart';

void main()async {
  await GetStorage.init();
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({Key?key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StorageUtils.isFirstTimeLogin()? LoginPage() : HomePage()
     );
   }
 }
 