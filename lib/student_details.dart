import 'package:flutter/material.dart';

class Student {
  String name;
  String studentId;
  String course;
  String yearLevel;
  String section;
  String email;
  String contactNumber;
  String address;
  String status;
  String enrollmentStatus;

  Student({
    required this.name,
    required this.studentId,
    required this.course,
    required this.yearLevel,
    required this.section,
    required this.email,
    required this.contactNumber,
    required this.address,
    required this.status,
    required this.enrollmentStatus,
  });
}

class StudentDetailsScreen extends StatefulWidget {
  final Student student;

  const StudentDetailsScreen({super.key, required this.student});

  @override
  State<StudentDetailsScreen> createState() {
    return _StudentDetailsScreenState();
  }
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  void editStudent() {
    TextEditingController name = TextEditingController(
      text: widget.student.name,
    );

    TextEditingController studentId = TextEditingController(
      text: widget.student.studentId,
    );

    TextEditingController course = TextEditingController(
      text: widget.student.course,
    );

    TextEditingController yearLevel = TextEditingController(
      text: widget.student.yearLevel,
    );

    TextEditingController section = TextEditingController(
      text: widget.student.section,
    );

    TextEditingController email = TextEditingController(
      text: widget.student.email,
    );

    TextEditingController contact = TextEditingController(
      text: widget.student.contactNumber,
    );

    TextEditingController address = TextEditingController(
      text: widget.student.address,
    );

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Student'),

          content: SingleChildScrollView(
            child: Column(
              children: [
                editField('Name', name),
                editField('Student ID', studentId),
                editField('Course', course),
                editField('Year Level', yearLevel),
                editField('Section', section),
                editField('Email', email),
                editField('Contact Number', contact),
                editField('Address', address),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.student.name = name.text;
                  widget.student.studentId = studentId.text;
                  widget.student.course = course.text;
                  widget.student.yearLevel = yearLevel.text;
                  widget.student.section = section.text;
                  widget.student.email = email.text;
                  widget.student.contactNumber = contact.text;
                  widget.student.address = address.text;
                });

                Navigator.pop(context);
              },

              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget editField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool active = widget.student.status == 'Active';

    return Scaffold(
      backgroundColor: const Color(0xFFEAF6FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2D68C4),

        iconTheme: const IconThemeData(color: Colors.white),

        title: const Text(
          'Student Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Student picture
            const CircleAvatar(
              radius: 52,
              backgroundColor: Color(0xFFB9DDF5),

              child: Icon(Icons.person, size: 65, color: Color(0xFF173B68)),
            ),

            const SizedBox(height: 10),

            // Student name
            Text(
              widget.student.name,

              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Active / Inactive
            Container(
              padding: const EdgeInsets.all(8),

              decoration: BoxDecoration(
                color: active
                    ? const Color(0xFFD5F5DF)
                    : const Color(0xFFFFE0E0),

                borderRadius: BorderRadius.circular(20),
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: active ? Colors.green : Colors.red,
                  ),

                  const SizedBox(width: 7),

                  Text(
                    widget.student.status,

                    style: TextStyle(
                      color: active ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 2),

            // Edit button
            TextButton.icon(
              onPressed: editStudent,

              icon: const Icon(Icons.edit, size: 18, color: Color(0xFF2D68C4)),

              label: const Text(
                'Edit',

                style: TextStyle(
                  color: Color(0xFF2D68C4),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Student information
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(15),
              color: Colors.white,

              child: Column(
                children: [
                  informationRow(
                    Icons.person,
                    'Student ID',
                    widget.student.studentId,
                  ),

                  informationRow(Icons.school, 'Course', widget.student.course),

                  informationRow(
                    Icons.calendar_month,
                    'Year Level',
                    widget.student.yearLevel,
                  ),

                  informationRow(
                    Icons.groups,
                    'Section',
                    widget.student.section,
                  ),

                  informationRow(Icons.email, 'Email', widget.student.email),

                  informationRow(
                    Icons.phone,
                    'Contact Number',
                    widget.student.contactNumber,
                  ),

                  informationRow(
                    Icons.location_on,
                    'Address',
                    widget.student.address,
                  ),

                  informationRow(
                    Icons.description,
                    'Enrollment Status',
                    widget.student.enrollmentStatus,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget informationRow(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
      ),

      child: Row(
        children: [
          Icon(icon, color: Color(0xFF173B68)),

          const SizedBox(width: 15),

          SizedBox(
            width: 130,

            child: Text(
              label,

              style: const TextStyle(color: Color(0xFF173B68)),
            ),
          ),

          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
