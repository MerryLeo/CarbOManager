/*
  Flutter Application for managing type 1 diabetes nutrition
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => MyAppModel(), child: const MyApp()));
}

class MyAppModel with ChangeNotifier {}

class MyApp extends StatelessWidget {
  static const String applicationTitle = 'CarbOManager';
  static final ThemeData themeData = ThemeData(primarySwatch: Colors.blue);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: applicationTitle,
      theme: themeData,
      home: const MainView(),
    );
  }
}
