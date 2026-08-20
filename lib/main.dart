import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Profile {
  final String image;
  final String name;
  final String course;
  final String yearLevel;
  final int age;
  final String hobby;
  final String studentId;
  final String email;
  final String favoriteSubject;

  const Profile({
    required this.image,
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.age,
    required this.hobby,
    required this.studentId,
    required this.email,
    required this.favoriteSubject,
  });
}

final List<Profile> profiles = [
  Profile(
    image: 'assets/images/Profile Image 1.png',
    name: 'Jhanine Domen',
    course: 'BSIT',
    yearLevel: '3rd Year',
    age: 20,
    hobby: 'Doing Makeups',
    studentId: '2001-001',
    email: 'jhaninedomen20@gmail.com',
    favoriteSubject: 'Programming',
  ),

  Profile(
    image: 'assets/images/Profile Image 2.png',
    name: 'Karol Rphael Pal',
    course: 'BSIT',
    yearLevel: '3rd Year',
    age: 21,
    hobby: 'Playing Mobile Legends',
    studentId: '2002-002',
    email: 'karolrapaelpal21@gmail.com',
    favoriteSubject: 'Database',
  ),

  Profile(
    image: 'assets/images/Profile Image 3.png',
    name: 'Jan Liebert Tabares',
    course: 'BTVTED',
    yearLevel: '2nd Year',
    age: 20,
    hobby: 'Playing Basketball',
    studentId: '2003-003',
    email: 'janlieberttabares20@gmail.com',
    favoriteSubject: 'Machine Shop and Benchwork',
  ),

  Profile(
    image: 'assets/images/Profile Image 4.png',
    name: 'Vanneza Jane Domen',
    course: 'BEED',
    yearLevel: '1st Year',
    age: 18,
    hobby: 'Dancing',
    studentId: '2004  -004',
    email: 'vannezajanedomen18@gmail.com',
    favoriteSubject: 'Teaching in the Learning Area of English',
  ),

  Profile(
    image: 'assets/images/Profile Image 5.png',
    name: 'Renei Mae Domen',
    course: 'BEED',
    yearLevel: '4th Year',
    age: 22,
    hobby: 'Watching Movies',
    studentId: '2005-005',
    email: 'reneimaedomen@gmail.com',
    favoriteSubject: 'English',
  ),

  Profile(
    image: 'assets/images/Profile Image 6.png',
    name: 'Caroline Villanueva',
    course: 'BIT',
    yearLevel: '3rd Year',
    age: 20,
    hobby: 'Playing Guitar',
    studentId: '2006-006',
    email: 'carolinevillanueva20@gmail.com',
    favoriteSubject: 'Robotics and Automation',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void sortStudentsByName() {
    setState(() {
      profiles.sort((a, b) => a.name.compareTo(b.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Capture the Flag 4: The Student List'),
      ),

      body: profiles.isEmpty
          ? const EmptyStudentState()
          : ListView(
              padding: const EdgeInsets.all(10),
              children: [
                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    'Student List',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromRGBO(67, 103, 157, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton.icon(
                    onPressed: sortStudentsByName,
                    icon: const Icon(Icons.sort_by_alpha),
                    label: const Text('Sort Students by Name'),
                  ),
                ),

                const SizedBox(height: 15),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: profiles.length,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ProfileCard(profile: profiles[index]),
                    );
                  },
                ),

                const SizedBox(height: 10),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Text(
                          'My Favorites',
                          style: TextStyle(
                            fontSize: 26,
                            color: Color.fromRGBO(67, 103, 157, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          'Favorite Things I Do: Make Ups',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(67, 103, 157, 1),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Favorite Food: Ham',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(67, 103, 157, 1),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'Favorite Brand Shoes: Adidas',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(67, 103, 157, 1),
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Things I Love',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(width: 30),

                            Text(
                              'Food',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
    );
  }
}

class EmptyStudentState extends StatelessWidget {
  const EmptyStudentState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school_outlined,
            size: 80,
            color: Color.fromRGBO(67, 103, 157, 1),
          ),

          SizedBox(height: 20),

          Text(
            'No students found.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(67, 103, 157, 1),
            ),
          ),

          SizedBox(height: 10),

          Text(
            'The student list is currently empty.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Image.asset(
              profile.image,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 10),

            Text(
              profile.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(67, 103, 157, 1),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                shadows: [Shadow(blurRadius: 3, offset: Offset(1, 1))],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Course: ${profile.course}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(67, 103, 157, 1),
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Year Level: ${profile.yearLevel}',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(67, 103, 157, 1),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Age: ${profile.age}',
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(67, 103, 157, 1),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Hobby: ${profile.hobby}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(67, 103, 157, 1),
                fontWeight: FontWeight.w500,
              ),
            ),

            const Divider(height: 30),

            Text(
              'Student ID: ${profile.studentId}',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            Text(
              'Email: ${profile.email}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 8),

            Text(
              'Favorite Subject: ${profile.favoriteSubject}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
