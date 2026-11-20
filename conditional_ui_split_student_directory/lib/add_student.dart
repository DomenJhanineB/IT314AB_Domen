import 'package:flutter/material.dart';
import 'student_details.dart';
import 'student_storage.dart';

class AddStudentScreen extends StatefulWidget {
  final List<Student> existingStudents;

  const AddStudentScreen({super.key, required this.existingStudents});

  @override
  State<AddStudentScreen> createState() {
    return _AddStudentScreenState();
  }
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController studentIdController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController courseController = TextEditingController();

  final TextEditingController yearLevelController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    studentIdController.dispose();
    nameController.dispose();
    courseController.dispose();
    yearLevelController.dispose();
    emailController.dispose();

    super.dispose();
  }

  Future<void> enrollStudent() async {
    if (formKey.currentState!.validate()) {
      Student newStudent = Student(
        studentId: studentIdController.text.trim(),
        name: nameController.text.trim(),
        course: courseController.text.trim(),
        yearLevel: yearLevelController.text.trim(),
        email: emailController.text.trim(),
        section: 'Not assigned',
        contactNumber: 'Not provided',
        address: 'Not provided',
        status: 'Active',
        enrollmentStatus: 'Enrolled',
      );

      widget.existingStudents.add(newStudent);

      await StudentStorage.saveStudents(widget.existingStudents);

      studentIdController.clear();
      nameController.clear();
      courseController.clear();
      yearLevelController.clear();
      emailController.clear();

      if (!mounted) return;

      Navigator.pop(context, true);
    }
  }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Student Enrollment Form',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Enter the student information below.'),
              const SizedBox(height: 20),

              const Text('Student ID'),
              const SizedBox(height: 8),
              TextFormField(
                controller: studentIdController,
                decoration: const InputDecoration(
                  hintText: 'Enter Student ID',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a Student ID';
                  }

                  for (Student student in widget.existingStudents) {
                    if (student.studentId.toLowerCase() ==
                        value.trim().toLowerCase()) {
                      return 'This Student ID already exists';
                    }
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),
              const Text('Full Name'),
              const SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Full Name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the student name';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),
              const Text('Course'),
              const SizedBox(height: 8),
              TextFormField(
                controller: courseController,
                decoration: const InputDecoration(
                  hintText: 'Enter Course',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the course';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),
              const Text('Year Level'),
              const SizedBox(height: 8),
              TextFormField(
                controller: yearLevelController,
                decoration: const InputDecoration(
                  hintText: 'Enter Year Level (e.g. 1st Year)',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the year level';
                  }

                  if (![
                    '1st Year',
                    '2nd Year',
                    '3rd Year',
                    '4th Year',
                  ].contains(value.trim())) {
                    return 'Enter 1st Year, 2nd Year, 3rd Year, or 4th Year';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),
              const Text('Email Address'),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter Email Address',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an email address';
                  }

                  if (!RegExp(
                    r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                  ).hasMatch(value.trim())) {
                    return 'Please enter a valid email address';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: enrollStudent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D68C4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Enroll Student'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
