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

  void deleteStudent(Profile profile) {
    setState(() {
      profiles.remove(profile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Capture the Flag 5: Student Interactions'),
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
                      child: ProfileCard(
                        profile: profiles[index],
                        onDelete: deleteStudent,
                      ),
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

class ProfileCard extends StatefulWidget {
  final Profile profile;
  final Function(Profile) onDelete;

  const ProfileCard({super.key, required this.profile, required this.onDelete});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool isFavorite = false;

  void showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Student'),

          content: Text('Edit action triggered for ${widget.profile.name}.'),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },

              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.profile.name} card tapped.')),
        );
      },

      child: Card(
        elevation: isFavorite ? 8 : 4,

        color: isFavorite ? Colors.amber.shade50 : Colors.white,

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              Image.asset(
                widget.profile.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 10),

              Text(
                widget.profile.name,
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
                'Course: ${widget.profile.course}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromRGBO(67, 103, 157, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Year Level: ${widget.profile.yearLevel}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(67, 103, 157, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                'Age: ${widget.profile.age}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(67, 103, 157, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Hobby: ${widget.profile.hobby}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(67, 103, 157, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Divider(height: 30),

              Text(
                'Student ID: ${widget.profile.studentId}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Email: ${widget.profile.email}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Favorite Subject: ${widget.profile.favoriteSubject}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 15),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },

                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),

                    label: Text(isFavorite ? 'Favorited' : 'Favorite'),
                  ),

                  ElevatedButton.icon(
                    onPressed: showEditDialog,

                    icon: const Icon(Icons.edit),

                    label: const Text('Edit'),
                  ),

                  ElevatedButton.icon(
                    onPressed: () {
                      widget.onDelete(widget.profile);
                    },

                    icon: const Icon(Icons.delete),

                    label: const Text('Delete'),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              if (isFavorite)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 20),

                    SizedBox(width: 5),

                    Text(
                      'Favorite Student',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
