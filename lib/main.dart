import 'package:flutter/material.dart';
import 'flag3_empty_directory.dart' as flag3;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const flag3.EmptyDirectoryFlag3(),
    );
  }
}
