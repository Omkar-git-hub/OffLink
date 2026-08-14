import 'package:flutter/material.dart';

import 'features/home/home_screen.dart';

void main() {
  runApp(const OffLinkApp());
}

class OffLinkApp extends StatelessWidget {
  const OffLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OffLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}