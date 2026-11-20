import 'package:flutter/material.dart';

import 'models/student.dart';
import 'viewmodels/student_viewmodel.dart';
import 'views/student_details.dart';
import 'views/add_student.dart';

// This list receives student records from the Neon database.
List<Student> students = [];

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
  final StudentViewModel studentViewModel = StudentViewModel();

  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    loadStudentData();
  }

  // Retrieve students from the Neon database.
  Future<void> loadStudentData() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    await studentViewModel.loadStudents();

    if (!mounted) return;

    setState(() {
      students = studentViewModel.students;
      errorMessage = studentViewModel.errorMessage;
      isLoading = false;
    });

    debugPrint('STUDENT DIRECTORY LOADING COMPLETED');
    debugPrint('Current student count: ${students.length}');

    if (errorMessage.isNotEmpty) {
      debugPrint('STUDENT DIRECTORY ERROR: $errorMessage');
    }
  }

  // Open the Add Student screen.
  Future<void> openAddStudent() async {
    await Navigator.pushNamed(context, '/add-student');

    if (!mounted) return;

    setState(() {});
  }

  // Delete a student from the Neon database.
  Future<void> deleteStudent(int index) async {
    final student = students[index];

    // Check if the student has a database ID.
    if (student.id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot delete student: Database ID is missing.'),
        ),
      );
      return;
    }

    try {
      // Send the DELETE request through the ViewModel.
      await studentViewModel.deleteStudent(student.id!);

      if (!mounted) return;

      // Remove the student from the screen after successful deletion.
      setState(() {
        students.removeAt(index);
      });

      debugPrint('Student deleted successfully from Neon.');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student deleted successfully.')),
      );
    } catch (error) {
      debugPrint('DELETE STUDENT ERROR: $error');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unable to delete student: $error')),
      );
    }
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

    if (errorMessage.isNotEmpty) {
      return Scaffold(
        backgroundColor: const Color(0xFFEAF6FF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2D68C4),
          title: const Text(
            'Student Directory',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.cloud_off, size: 50, color: Colors.red),
                const SizedBox(height: 15),
                const Text(
                  'Unable to Load Students',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(errorMessage, textAlign: TextAlign.center),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: loadStudentData,
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
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

  // Display one student row.
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
