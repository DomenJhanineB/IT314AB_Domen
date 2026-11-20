import '../core/api/api_service.dart';
import '../models/student.dart';

class StudentService {
  final ApiService apiService = ApiService();

  // Retrieve students from the API.
  Future<List<Student>> getStudents() async {
    final studentData = await apiService.getStudents();

    List<Student> students = studentData.map((data) {
      return Student.fromJson(data);
    }).toList();

    return students;
  }

  // Add a new student through the API.
  Future<Map<String, dynamic>> addStudent(
    Map<String, dynamic> studentData,
  ) async {
    return await apiService.addStudent(studentData);
  }

  // Update an existing student through the API.
  Future<Map<String, dynamic>> updateStudent(
    int id,
    Map<String, dynamic> studentData,
  ) async {
    return await apiService.updateStudent(id, studentData);
  }

  // Delete a student through the API.
  Future<void> deleteStudent(int id) async {
    await apiService.deleteStudent(id);
  }
}
