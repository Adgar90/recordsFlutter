import 'package:flutter/material.dart';
import 'package:records/vistes/landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
          cardColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Notes'),
      debugShowCheckedModeBanner: false,
    );
  }
}
