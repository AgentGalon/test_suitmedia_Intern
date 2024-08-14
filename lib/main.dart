import 'package:flutter/material.dart';

import 'package:test_suitmedia_intern/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Test Suitmedia",
      home: SafeArea(
        child: Login(),
      ),
    );
  }
}
