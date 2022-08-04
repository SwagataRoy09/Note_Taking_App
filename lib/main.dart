import 'package:flutter/material.dart';
import 'package:notesapp/MainPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xfff5f5f5),foregroundColor:Color(0xff0d47a1)),
        splashColor: Color(0xff00bcd4),
        scaffoldBackgroundColor: Color(0xffe9f1f2),
        hoverColor: Color(0xff26c6da),
        shadowColor: Colors.black,
        fontFamily: 'Itim',
      ),
      home: MainPage()));
}
