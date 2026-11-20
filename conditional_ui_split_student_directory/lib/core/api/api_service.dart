import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:3000';

  Future<List<dynamic>> getStudents() async {
    final url = Uri.parse('$baseUrl/api/students');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['success'] == true) {
          return data['students'];
        } else {
          throw Exception('Unable to retrieve students.');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('API connection failed: $error');
    }
  }

  Future<Map<String, dynamic>> addStudent(
    Map<String, dynamic> studentData,
  ) async {
    final url = Uri.parse('$baseUrl/api/students');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(studentData),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 201 && data['success'] == true) {
        return data['student'];
      }

      throw Exception(data['message'] ?? 'Unable to add student.');
    } catch (error) {
      throw Exception('Add student failed: $error');
    }
  }

  // Delete an existing student through the API.
  Future<void> deleteStudent(int id) async {
    final url = Uri.parse('$baseUrl/api/students/$id');

    try {
      final response = await http.delete(url);

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        return;
      }

      throw Exception(data['message'] ?? 'Unable to delete student.');
    } catch (error) {
      throw Exception('Delete student failed: $error');
    }
  }

  Future<Map<String, dynamic>> updateStudent(
    int id,
    Map<String, dynamic> studentData,
  ) async {
    final url = Uri.parse('$baseUrl/api/students/$id');

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(studentData),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        return data['student'];
      }

      throw Exception(data['message'] ?? 'Unable to update student.');
    } catch (error) {
      throw Exception('Update student failed: $error');
    }
  }
}
