// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_test_task/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

// ignore: prefer_match_file_name
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
