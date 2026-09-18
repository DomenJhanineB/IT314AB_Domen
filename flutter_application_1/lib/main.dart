import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String friend1 = 'MissYouLikeKrazy';
String friend2 = 'bread';
String friend3 = 'The14th';
String friend4 = 'Carlvendish';
String friend5 = 'D1yah';

String status1 = 'Online - VALORANT';
String status2 = 'Online - VALORANT';
String status3 = 'Online - VALORANT';
String status4 = 'Away - Riot Mobile';
String status5 = 'Away - Riot Mobile';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: const Color(0xFF0F0B0C),

        appBar: AppBar(
          backgroundColor: const Color(0xFF0F0B0C),

          title: const Text(
            'Social',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 55,

                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFF302A2C), width: 1),
                  ),
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,

                        child: const Text(
                          'Friends',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        alignment: Alignment.center,

                        child: const Text(
                          'Messages',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        alignment: Alignment.center,

                        child: const Text(
                          'Socials',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),

                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFF302A2C),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.white, size: 25),

                    SizedBox(width: 15),

                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),

                child: const Row(
                  children: [
                    Text(
                      'Valorant',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 10),

                    Text(
                      '3',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,

                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                padding: const EdgeInsets.all(12),

                color: const Color(0xFF1C181A),

                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,

                      child: Icon(Icons.person, color: Colors.red, size: 30),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          friend1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          status1,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,

                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                padding: const EdgeInsets.all(12),

                color: const Color(0xFF1C181A),

                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,

                      child: Icon(Icons.person, color: Colors.red, size: 30),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          friend2,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          status2,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,

                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                padding: const EdgeInsets.all(12),

                color: const Color(0xFF1C181A),

                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,

                      child: Icon(Icons.person, color: Colors.red, size: 30),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          friend3,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          status3,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),

                child: const Row(
                  children: [
                    Text(
                      'Riot Mobile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 10),

                    Text(
                      '2',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,

                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                padding: const EdgeInsets.all(12),

                color: const Color(0xFF1C181A),

                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,

                      child: Icon(Icons.person, color: Colors.red, size: 30),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          friend4,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          status4,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,

                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                padding: const EdgeInsets.all(12),

                color: const Color(0xFF1C181A),

                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,

                      child: Icon(Icons.person, color: Colors.red, size: 30),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          friend5,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          status5,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
