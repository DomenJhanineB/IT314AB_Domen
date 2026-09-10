import 'package:flutter/material.dart';

String student1 = 'Baran Zac';
String student2 = 'Boragay Vanneza Jane';
String student3 = 'Dela Cruz Irish';
String student4 = 'Domen Jhanine';
String student5 = 'Domen Renei Mae';
String student6 = 'Gubalane Maria Grace';
String student7 = 'Pal Karol Raphael';
String student8 = 'Tabares Jan Liebert';
String student9 = 'Villanueva Caroline';
String student10 = 'Villanueva Junior';

String status1 = 'Active';
String status2 = 'Active';
String status3 = 'Active';
String status4 = 'Active';
String status5 = 'Active';
String status6 = 'Active';
String status7 = 'Inactive';
String status8 = 'Inactive';
String status9 = 'Inactive';
String status10 = 'Inactive';

class EmptyDirectoryFlag3 extends StatefulWidget {
  const EmptyDirectoryFlag3({super.key});

  @override
  State<EmptyDirectoryFlag3> createState() => _EmptyDirectoryFlag3State();
}

class _EmptyDirectoryFlag3State extends State<EmptyDirectoryFlag3> {
  String selectedStatus = '';

  bool student1Visible = true;
  bool student2Visible = true;
  bool student3Visible = true;
  bool student4Visible = true;
  bool student5Visible = true;
  bool student6Visible = true;
  bool student7Visible = true;
  bool student8Visible = true;
  bool student9Visible = true;
  bool student10Visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Directory'),
        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ACTIVE AND INACTIVE BUTTONS
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedStatus = 'Active';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00356B),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Active'),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedStatus = 'Inactive';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00356B),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Inactive'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // EMPTY DIRECTORY
            if (!student1Visible &&
                !student2Visible &&
                !student3Visible &&
                !student4Visible &&
                !student5Visible &&
                !student6Visible &&
                !student7Visible &&
                !student8Visible &&
                !student9Visible &&
                !student10Visible)
              const Column(
                children: [
                  SizedBox(height: 50),

                  Icon(Icons.people_outline, size: 60),

                  SizedBox(height: 10),

                  Text(
                    'No students found',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

            // INITIAL STUDENT LIST
            if (selectedStatus == '' &&
                (student1Visible ||
                    student2Visible ||
                    student3Visible ||
                    student4Visible ||
                    student5Visible ||
                    student6Visible ||
                    student7Visible ||
                    student8Visible ||
                    student9Visible ||
                    student10Visible))
              Column(
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          'No.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      Expanded(
                        child: Text(
                          'Student Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  if (student1Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('1')),
                        Expanded(child: Text(student1)),
                      ],
                    ),

                  if (student2Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('2')),
                        Expanded(child: Text(student2)),
                      ],
                    ),

                  if (student3Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('3')),
                        Expanded(child: Text(student3)),
                      ],
                    ),

                  if (student4Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('4')),
                        Expanded(child: Text(student4)),
                      ],
                    ),

                  if (student5Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('5')),
                        Expanded(child: Text(student5)),
                      ],
                    ),

                  if (student6Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('6')),
                        Expanded(child: Text(student6)),
                      ],
                    ),

                  if (student7Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('7')),
                        Expanded(child: Text(student7)),
                      ],
                    ),

                  if (student8Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('8')),
                        Expanded(child: Text(student8)),
                      ],
                    ),

                  if (student9Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('9')),
                        Expanded(child: Text(student9)),
                      ],
                    ),

                  if (student10Visible)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('10')),
                        Expanded(child: Text(student10)),
                      ],
                    ),
                ],
              ),

            // ACTIVE / INACTIVE LIST
            if (selectedStatus != '' &&
                (student1Visible ||
                    student2Visible ||
                    student3Visible ||
                    student4Visible ||
                    student5Visible ||
                    student6Visible ||
                    student7Visible ||
                    student8Visible ||
                    student9Visible ||
                    student10Visible))
              Column(
                children: [
                  // HEADER
                  const Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          'No.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      Expanded(
                        child: Text(
                          'Student Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        width: 100,
                        child: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        width: 120,
                        child: Text(
                          'Action',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // STUDENT 1
                  if (student1Visible && selectedStatus == status1)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('1')),

                        Expanded(child: Text(student1)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status1,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student1Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // STUDENT 2
                  if (student2Visible && selectedStatus == status2)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('2')),

                        Expanded(child: Text(student2)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status2,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student2Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // STUDENT 3
                  if (student3Visible && selectedStatus == status3)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('3')),

                        Expanded(child: Text(student3)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status3,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student3Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // STUDENT 4
                  if (student4Visible && selectedStatus == status4)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('4')),

                        Expanded(child: Text(student4)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status4,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student4Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // STUDENT 5
                  if (student5Visible && selectedStatus == status5)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('5')),

                        Expanded(child: Text(student5)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status5,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student5Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // STUDENT 6
                  if (student6Visible && selectedStatus == status6)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('6')),

                        Expanded(child: Text(student6)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status6,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student6Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // STUDENT 7
                  if (student7Visible && selectedStatus == status7)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('7')),

                        Expanded(child: Text(student7)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status7,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student7Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // STUDENT 8
                  if (student8Visible && selectedStatus == status8)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('8')),

                        Expanded(child: Text(student8)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status8,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student8Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // STUDENT 9
                  if (student9Visible && selectedStatus == status9)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('9')),

                        Expanded(child: Text(student9)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status9,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student9Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  // STUDENT 10
                  if (student10Visible && selectedStatus == status10)
                    Row(
                      children: [
                        const SizedBox(width: 50, child: Text('10')),

                        Expanded(child: Text(student10)),

                        SizedBox(
                          width: 100,
                          child: Text(
                            status10,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),

                        SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    student10Visible = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
