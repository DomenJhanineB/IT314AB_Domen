import 'package:flutter/material.dart';

import 'student_details.dart';
import 'add_student.dart';
import 'student_storage.dart';

List<Student> students = [
  Student(
    name: 'Baran Zac',
    studentId: '2024-001',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'baranzac@example.com',
    contactNumber: '09123456789',
    address: 'Cebu City',
    status: 'Active',
    enrollmentStatus: 'Enrolled',
  ),
  Student(
    name: 'Boragay Vanneza Jane',
    studentId: '2024-002',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'boragay@example.com',
    contactNumber: '09123456790',
    address: 'Cebu City',
    status: 'Active',
    enrollmentStatus: 'Enrolled',
  ),
  Student(
    name: 'Dela Cruz Irish',
    studentId: '2024-003',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'delacruz@example.com',
    contactNumber: '09123456791',
    address: 'Cebu City',
    status: 'Active',
    enrollmentStatus: 'Enrolled',
  ),
  Student(
    name: 'Domen Jhanine',
    studentId: '2024-004',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'domen@example.com',
    contactNumber: '09123456792',
    address: 'Cebu City',
    status: 'Active',
    enrollmentStatus: 'Enrolled',
  ),
  Student(
    name: 'Domen Renei Mae',
    studentId: '2024-005',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'renei@example.com',
    contactNumber: '09123456793',
    address: 'Cebu City',
    status: 'Active',
    enrollmentStatus: 'Enrolled',
  ),
  Student(
    name: 'Gubalane Maria Grace',
    studentId: '2024-006',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'gubalane@example.com',
    contactNumber: '09123456794',
    address: 'Cebu City',
    status: 'Active',
    enrollmentStatus: 'Enrolled',
  ),
  Student(
    name: 'Pal Karol Raphael',
    studentId: '2024-007',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'pal@example.com',
    contactNumber: '09123456795',
    address: 'Cebu City',
    status: 'Inactive',
    enrollmentStatus: 'Not Enrolled',
  ),
  Student(
    name: 'Tabares Jan Liebert',
    studentId: '2024-008',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'tabares@example.com',
    contactNumber: '09123456796',
    address: 'Cebu City',
    status: 'Inactive',
    enrollmentStatus: 'Not Enrolled',
  ),
  Student(
    name: 'Villanueva Caroline',
    studentId: '2024-009',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'villanueva.c@example.com',
    contactNumber: '09123456797',
    address: 'Cebu City',
    status: 'Inactive',
    enrollmentStatus: 'Not Enrolled',
  ),
  Student(
    name: 'Villanueva Junior',
    studentId: '2024-010',
    course: 'BSIT',
    yearLevel: '3rd Year',
    section: 'BSIT-3A',
    email: 'villanueva.j@example.com',
    contactNumber: '09123456798',
    address: 'Cebu City',
    status: 'Inactive',
    enrollmentStatus: 'Not Enrolled',
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/student-list',
      routes: {
        '/student-list': (context) {
          return const StudentDirectory();
        },
        '/student-details': (context) {
          Student student =
              ModalRoute.of(context)!.settings.arguments as Student;

          return StudentDetailsScreen(student: student, allStudents: students);
        },
        '/add-student': (context) {
          return AddStudentScreen(existingStudents: students);
        },
      },
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
    loadStudentData();
  }

  Future<void> loadStudentData() async {
    try {
      List<Student>? savedStudents = await StudentStorage.loadStudents();

      if (!mounted) return;

      setState(() {
        if (savedStudents != null) {
          students = savedStudents;
        }

        isLoading = false;
      });

      debugPrint('STUDENT DIRECTORY LOADING COMPLETED');
      debugPrint('Current student count: ${students.length}');
    } catch (error) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      debugPrint('STUDENT DIRECTORY LOADING ERROR: $error');
    }
  }

  Future<void> openAddStudent() async {
    await Navigator.pushNamed(context, '/add-student');

    if (!mounted) return;

    setState(() {});
  }

  Future<void> deleteStudent(int index) async {
    setState(() {
      students.removeAt(index);
    });

    await StudentStorage.saveStudents(students);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFEAF6FF),
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFF2D68C4)),
        ),
      );
    }

    if (students.isEmpty) {
      return Scaffold(
        backgroundColor: const Color(0xFFEAF6FF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2D68C4),
          title: const Text(
            'Student Directory',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: openAddStudent,
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'No Students Found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEAF6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D68C4),
        title: const Text(
          'Student Directory',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: openAddStudent,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    'No.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Student Names',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    'Action',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                Student student = students[index];

                return studentRow(student, index, index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget studentRow(Student student, int originalIndex, int number) {
    bool isActive = student.status == 'Active';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 40, child: Text('$number')),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/student-details',
                  arguments: student,
                );
              },
              child: Text(
                student.name,
                style: const TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              student.status,
              style: TextStyle(
                color: isActive ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: Row(
              children: [
                if (isActive) const Icon(Icons.star, color: Colors.amber),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    deleteStudent(originalIndex);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
