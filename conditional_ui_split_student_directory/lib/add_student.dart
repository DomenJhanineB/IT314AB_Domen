import 'package:flutter/material.dart';

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF6FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2D68C4),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Add Student',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: const Center(
        child: Text(
          'Add Student Screen',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
