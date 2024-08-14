import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_suitmedia_intern/view/login_screen.dart';
import 'package:test_suitmedia_intern/viewmodel/user_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiUserProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
