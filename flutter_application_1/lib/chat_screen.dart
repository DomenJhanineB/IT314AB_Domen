import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  final String status;

  const ChatScreen({super.key, required this.name, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B0C),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0B0C),

        iconTheme: const IconThemeData(color: Colors.white),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              status,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          const Expanded(child: SizedBox()),

          Padding(
            padding: const EdgeInsets.all(10),

            child: TextField(
              style: const TextStyle(color: Colors.white),

              decoration: const InputDecoration(
                hintText: 'Send a message',
                hintStyle: TextStyle(color: Colors.white),

                filled: true,
                fillColor: Color(0xFF302A2C),

                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
