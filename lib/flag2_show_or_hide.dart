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

class ShowOrHideFlag2 extends StatefulWidget {
  const ShowOrHideFlag2({super.key});

  @override
  State<ShowOrHideFlag2> createState() => _ShowOrHideFlag2State();
}

class _ShowOrHideFlag2State extends State<ShowOrHideFlag2> {
  String selectedStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Directory'),
        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

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

            if (selectedStatus == '')
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

            if (selectedStatus != '')
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
                ],
              ),

            const SizedBox(height: 10),

            if (selectedStatus == '')
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('1')),
                      Expanded(child: Text(student1)),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('2')),
                      Expanded(child: Text(student2)),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('3')),
                      Expanded(child: Text(student3)),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('4')),
                      Expanded(child: Text(student4)),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('5')),
                      Expanded(child: Text(student5)),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('6')),
                      Expanded(child: Text(student6)),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('7')),
                      Expanded(child: Text(student7)),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('8')),
                      Expanded(child: Text(student8)),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('9')),
                      Expanded(child: Text(student9)),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('10')),
                      Expanded(child: Text(student10)),
                    ],
                  ),
                ],
              ),

            if (selectedStatus == 'Active')
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('1')),
                      Expanded(child: Text(student1)),

                      if (status1 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Active',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('2')),
                      Expanded(child: Text(student2)),

                      if (status2 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Active',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('3')),
                      Expanded(child: Text(student3)),

                      if (status3 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Active',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('4')),
                      Expanded(child: Text(student4)),

                      if (status4 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Active',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('5')),
                      Expanded(child: Text(student5)),

                      if (status5 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Active',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('6')),
                      Expanded(child: Text(student6)),

                      if (status6 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Active',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            if (selectedStatus == 'Inactive')
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('7')),
                      Expanded(child: Text(student7)),

                      if (status7 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Inactive',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('8')),
                      Expanded(child: Text(student8)),

                      if (status8 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Inactive',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('9')),
                      Expanded(child: Text(student9)),

                      if (status9 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Inactive',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 50, child: Text('10')),
                      Expanded(child: Text(student10)),

                      if (status10 == 'Active')
                        const Icon(Icons.star, color: Colors.yellow),

                      const SizedBox(width: 10),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          'Inactive',
                          style: TextStyle(color: Colors.red),
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
