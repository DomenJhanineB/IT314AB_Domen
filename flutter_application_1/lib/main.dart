import 'package:flutter/material.dart';
import 'chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SocialPage());
  }
}

List<String> names = [
  'MissYouLikeKrazy',
  'bread',
  'The14th',
  'Carlvendish',
  'D1yah',
];

List<String> statuses = [
  'Online - VALORANT',
  'Playing - VALORANT',
  'Playing - VALORANT',
  'Away - Riot Mobile',
  'Away - Riot Mobile',
];

List<bool> online = [true, true, true, false, false];

List<bool> pc = [true, true, true, false, false];

class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0B0C),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Social',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 15),

              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'Friends',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 35),

                    Text('Messages', style: TextStyle(color: Colors.grey)),

                    SizedBox(width: 35),

                    Text('Requests', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Color(0xFF302A2C),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white),

                    SizedBox(width: 10),

                    Text('Search', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'VALORANT 3',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 5),

              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                itemBuilder: (context, index) {
                  String playerName = names[index];

                  if (playerName.isEmpty) {
                    playerName = 'Unknown User';
                  }

                  String playerStatus = statuses[index];

                  if (playerStatus.isEmpty) {
                    playerStatus = 'No status available';
                  }

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChatScreen(
                              name: playerName,
                              status: playerStatus,
                              online: online[index],
                            );
                          },
                        ),
                      );
                    },

                    contentPadding: EdgeInsets.symmetric(horizontal: 20),

                    leading: CircleAvatar(
                      radius: 27,
                      backgroundColor: Color(0xFF302A2C),

                      child: Icon(
                        Icons.person,
                        color: online[index] ? Colors.red : Colors.white,
                        size: 30,
                      ),
                    ),

                    title: Text(
                      playerName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Row(
                      children: [
                        Icon(
                          pc[index]
                              ? Icons.desktop_windows
                              : Icons.phone_android,

                          color: Colors.grey,
                          size: 15,
                        ),

                        SizedBox(width: 5),

                        Text(
                          playerStatus,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Online 4',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 5),

              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                itemBuilder: (context, index) {
                  int number = index + 3;

                  String playerName = names[number];

                  if (playerName.isEmpty) {
                    playerName = 'Unknown User';
                  }

                  String playerStatus = statuses[number];

                  if (playerStatus.isEmpty) {
                    playerStatus = 'No status available';
                  }

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChatScreen(
                              name: playerName,
                              status: playerStatus,
                              online: online[number],
                            );
                          },
                        ),
                      );
                    },

                    contentPadding: EdgeInsets.symmetric(horizontal: 20),

                    leading: CircleAvatar(
                      radius: 27,
                      backgroundColor: Color(0xFF302A2C),

                      child: Icon(
                        Icons.person,
                        color: online[number] ? Colors.red : Colors.white,
                        size: 30,
                      ),
                    ),

                    title: Text(
                      playerName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Row(
                      children: [
                        Icon(
                          pc[number]
                              ? Icons.desktop_windows
                              : Icons.phone_android,

                          color: Colors.grey,
                          size: 15,
                        ),

                        SizedBox(width: 5),

                        Text(
                          playerStatus,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
