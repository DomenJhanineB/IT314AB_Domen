import 'package:flutter/material.dart';

String student1 = 'Baran Zac';
String student2 = 'Boragay Vanneza Jane';
String student3 = 'Dela Cruz Irish';
String student4 = 'Domen Jhanine';
String student5 = 'Domen Renei Mae';
String student6 = 'Gubalane Maria Grace';
String student7 = 'Pal Karol Raphael';
String student8 = 'Tabares Jan Liebert';
String student9 = 'Villanueva Caroline';
String student10 = 'Villanueva Junior';

bool active1 = true;
bool active2 = true;
bool active3 = true;
bool active4 = true;
bool active5 = true;
bool active6 = true;
bool active7 = false;
bool active8 = false;
bool active9 = false;
bool active10 = false;

bool student1Exists = true;
bool student2Exists = true;
bool student3Exists = true;
bool student4Exists = true;
bool student5Exists = true;
bool student6Exists = true;
bool student7Exists = true;
bool student8Exists = true;
bool student9Exists = true;
bool student10Exists = true;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StudentDirectory(),
    );
  }
}

class StudentDirectory extends StatefulWidget {
  const StudentDirectory({super.key});

  @override
  State<StudentDirectory> createState() {
    return _StudentDirectoryState();
  }
}

class _StudentDirectoryState extends State<StudentDirectory> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void deleteStudent(int number) {
    setState(() {
      if (number == 1) {
        student1Exists = false;
      }

      if (number == 2) {
        student2Exists = false;
      }

      if (number == 3) {
        student3Exists = false;
      }

      if (number == 4) {
        student4Exists = false;
      }

      if (number == 5) {
        student5Exists = false;
      }

      if (number == 6) {
        student6Exists = false;
      }

      if (number == 7) {
        student7Exists = false;
      }

      if (number == 8) {
        student8Exists = false;
      }

      if (number == 9) {
        student9Exists = false;
      }

      if (number == 10) {
        student10Exists = false;
      }
    });
  }

  bool noStudents() {
    if (student1Exists == false &&
        student2Exists == false &&
        student3Exists == false &&
        student4Exists == false &&
        student5Exists == false &&
        student6Exists == false &&
        student7Exists == false &&
        student8Exists == false &&
        student9Exists == false &&
        student10Exists == false) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D68C4),
        title: const Text(
          'Student Directory',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),

                  SizedBox(height: 15),

                  Text(
                    'Loading Students...',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : noStudents()
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_outline, size: 70, color: Colors.grey),

                  SizedBox(height: 10),

                  Text(
                    'No Students Found',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'No.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      SizedBox(width: 30),

                      Text(
                        'Student Names',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      SizedBox(width: 100),

                      Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      SizedBox(width: 50),

                      Text(
                        'Action',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Expanded(
                    child: ListView(
                      children: [
                        if (student1Exists) studentRow(1, student1, active1),

                        if (student2Exists) studentRow(2, student2, active2),

                        if (student3Exists) studentRow(3, student3, active3),

                        if (student4Exists) studentRow(4, student4, active4),

                        if (student5Exists) studentRow(5, student5, active5),

                        if (student6Exists) studentRow(6, student6, active6),

                        if (student7Exists) studentRow(7, student7, active7),

                        if (student8Exists) studentRow(8, student8, active8),

                        if (student9Exists) studentRow(9, student9, active9),

                        if (student10Exists)
                          studentRow(10, student10, active10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget studentRow(int number, String name, bool active) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(color: Colors.grey),

        borderRadius: BorderRadius.circular(8),
      ),

      child: Row(
        children: [
          Text('$number.'),

          const SizedBox(width: 30),

          SizedBox(width: 200, child: Text(name)),

          SizedBox(
            width: 100,
            child: Text(
              active ? 'Active' : 'Inactive',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: active ? Colors.green : Colors.red,
              ),
            ),
          ),

          if (active) const Icon(Icons.star, color: Colors.amber),

          IconButton(
            onPressed: () {
              deleteStudent(number);
            },

            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
