
class Student {
  int? id;
  int? programId;

  String studentId;
  String name;
  String firstName;
  String lastName;
  String email;
  String course;
  String yearLevel;
  String contactNumber;

  String section;
  String address;
  String status;
  String enrollmentStatus;

  Student({
    this.id,
    this.programId,
    required this.studentId,
    required this.name,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.course = '',
    this.yearLevel = '',
    this.contactNumber = '',
    this.section = 'Not assigned',
    this.address = 'Not provided',
    this.status = 'Active',
    this.enrollmentStatus = 'Not Enrolled',
  });

  // Convert database JSON into a Student object.
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['student_id'],
      programId: json['program_id'],

      studentId: json['student_number']?.toString() ?? 'Not assigned',

      name: json['student_name'] ?? '',

      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',

      email: json['email'] ?? '',

      course: json['program_code'] ?? json['course'] ?? 'Not assigned',

      yearLevel: json['year_level'] == null
          ? 'Not assigned'
          : '${json['year_level']}${json['year_level'] == 1 ? 'st' : json['year_level'] == 2 ? 'nd' : json['year_level'] == 3 ? 'rd' : 'th'} Year',

      contactNumber: json['contact_number'] ?? '',

      section: 'Not assigned',
      address: 'Not provided',

      // These are temporary display defaults.
      status: 'Active',
      enrollmentStatus: 'Not Enrolled',
    );
  }
}
