
import 'package:flutter/material.dart';
import '../models/student.dart';
import '../services/student_service.dart';

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

  final StudentService studentService = StudentService();

  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController yearLevelController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String selectedCourse = 'BSIT';

  bool isSaving = false;

  @override
  void dispose() {
    studentIdController.dispose();
    nameController.dispose();
    yearLevelController.dispose();
    emailController.dispose();

    super.dispose();
  }

  Future<void> enrollStudent() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isSaving = true;
    });

    try {
      final studentData = {
        'student_number': studentIdController.text.trim(),
        'student_name': nameController.text.trim(),
        'course': selectedCourse,
        'year_level': int.parse(
          yearLevelController.text.trim()[0],
        ),
        'email': emailController.text.trim(),
      };

      // Send the student information to the backend.
      final savedStudent = await studentService.addStudent(studentData);

      // Convert the saved database record into a Student object.
      Student newStudent = Student.fromJson(savedStudent);

      newStudent.enrollmentStatus = 'Enrolled';

      // Update the directory list after successful database saving.
      widget.existingStudents.add(newStudent);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Student successfully saved to the database!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString().replaceFirst('Exception: ', ''),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
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
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
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
              DropdownButtonFormField<String>(
                initialValue: selectedCourse,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'BSIT',
                    child: Text('BSIT'),
                  ),
                  DropdownMenuItem(
                    value: 'BSCS',
                    child: Text('BSCS'),
                  ),
                  DropdownMenuItem(
                    value: 'BSIS',
                    child: Text('BSIS'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCourse = value;
                    });
                  }
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
                  onPressed: isSaving ? null : enrollStudent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D68C4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: isSaving
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Enroll Student'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
