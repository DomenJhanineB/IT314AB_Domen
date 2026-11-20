import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'models/student.dart';

class StudentStorage {
  static const String storageKey = 'saved_students';

  static Future<void> saveStudents(List<Student> students) async {
    final preferences = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> studentList = students.map((student) {
      return {
        'name': student.name,
        'studentId': student.studentId,
        'course': student.course,
        'yearLevel': student.yearLevel,
        'section': student.section,
        'email': student.email,
        'contactNumber': student.contactNumber,
        'address': student.address,
        'status': student.status,
        'enrollmentStatus': student.enrollmentStatus,
      };
    }).toList();

    String encodedData = jsonEncode(studentList);

    await preferences.setString(storageKey, encodedData);
  }

  static Future<List<Student>?> loadStudents() async {
    final preferences = await SharedPreferences.getInstance();

    String? savedData = preferences.getString(storageKey);

    if (savedData == null) {
      return null;
    }

    List<dynamic> decodedData = jsonDecode(savedData);

    return decodedData.map((data) {
      return Student(
        name: data['name'],
        studentId: data['studentId'],
        course: data['course'],
        yearLevel: data['yearLevel'],
        section: data['section'],
        email: data['email'],
        contactNumber: data['contactNumber'],
        address: data['address'],
        status: data['status'],
        enrollmentStatus: data['enrollmentStatus'],
      );
    }).toList();
  }
}
