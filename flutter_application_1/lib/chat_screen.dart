import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  final String status;
  final bool online;

  ChatScreen({required this.name, required this.status, required this.online});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0B0C),

      appBar: AppBar(
        backgroundColor: Color(0xFF0F0B0C),

        iconTheme: IconThemeData(color: Colors.white),

        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFF302A2C),

              child: Icon(
                Icons.person,
                color: online ? Colors.red : Colors.white,
              ),
            ),

            SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.isEmpty ? 'Unknown User' : name,

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  status.isEmpty ? 'No status available' : status,

                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),

        actions: [
          Icon(Icons.more_horiz, color: Colors.white),

          SizedBox(width: 15),
        ],
      ),

      body: Column(
        children: [
          Expanded(child: SizedBox()),

          Padding(
            padding: EdgeInsets.all(10),

            child: TextField(
              style: TextStyle(color: Colors.white),

              decoration: InputDecoration(
                hintText: 'Send a message',

                hintStyle: TextStyle(color: Colors.grey),

                filled: true,

                fillColor: Color(0xFF302A2C),

                suffixIcon: Icon(Icons.send, color: Colors.grey),

                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
