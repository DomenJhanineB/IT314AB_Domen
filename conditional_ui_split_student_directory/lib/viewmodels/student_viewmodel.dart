import '../models/student.dart';
import '../services/student_service.dart';

class StudentViewModel {
  final StudentService studentService = StudentService();

  List<Student> students = [];

  bool isLoading = false;
  String errorMessage = '';

  Future<void> loadStudents() async {
    isLoading = true;
    errorMessage = '';

    try {
      students = await studentService.getStudents();
    } catch (error) {
      errorMessage = error.toString();
    }

    isLoading = false;
  }

  // Delete a student using the database ID.
  Future<void> deleteStudent(int id) async {
    await studentService.deleteStudent(id);
  }
}
