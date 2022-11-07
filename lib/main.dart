import 'package:flutter/material.dart';
import 'Read/ReadData.dart';
import 'Add/add_user.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API CRUD',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.blue),
        ),
      ),
      home: const ReadData(),
    );
  }
}
