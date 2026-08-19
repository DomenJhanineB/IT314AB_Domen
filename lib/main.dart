import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Profile {
  final String? image;
  final String? name;
  final String? courseSection;
  final int? age;
  final String? hobby;

  const Profile({
    this.image,
    this.name,
    this.courseSection,
    this.age,
    this.hobby,
  });
}

final List<Profile> profiles = [
  Profile(
    image: 'assets/images/Profile Image 1.png',
    name: 'Jhanine Domen',
    courseSection: 'BSIT-3',
    age: 20,
    hobby: 'Doing Makeups',
  ),

  Profile(
    image: 'assets/images/Profile Image 2.png',
    name: 'Karol Rphael Pal',
    courseSection: 'BSIT-3',
    age: 21,
    hobby: 'Playing Mobile Legends',
  ),

  Profile(
    image: 'assets/images/Profile Image 3.png',
    name: 'Jan Liebert Tabares',
    courseSection: 'BTVETD-2',
    age: 20,
    hobby: null,
  ),

  Profile(
    image: 'assets/images/Profile Image 4.png',
    name: 'Vanneza Jane Domen',
    courseSection: null,
    age: 18,
    hobby: 'Dancing',
  ),

  Profile(
    image: 'assets/images/Profile Image 5.png',
    name: null,
    courseSection: 'Review for LPT',
    age: 22,
    hobby: 'Watching Movies',
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Capture the Flag 3: Data-Driven UI'),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                'Five Profiles',
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromRGBO(67, 103, 157, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),
              ProfileCard(profile: profiles[0]),

              const SizedBox(height: 20),
              ProfileCard(profile: profiles[1]),

              const SizedBox(height: 20),
              ProfileCard(profile: profiles[2]),

              const SizedBox(height: 20),
              ProfileCard(profile: profiles[3]),

              const SizedBox(height: 20),
              ProfileCard(profile: profiles[4]),

              const SizedBox(height: 30),

              Card(
                child: Column(
                  children: [
                    const SizedBox(height: 15),

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

                    const SizedBox(height: 15),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
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
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            profile.image != null
                ? Image.asset(
                    profile.image!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.person, size: 150),

            Text(
              profile.name ?? 'Name not provided',
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
              profile.courseSection ?? 'Course: Unknown',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(67, 103, 157, 1),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),

            const SizedBox(height: 15),
            Text(
              'Age: ${profile.age ?? 'Not provided'}',
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(67, 103, 157, 1),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),
            Text(
              'Hobby: ${profile.hobby ?? 'Not provided'}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(67, 103, 157, 1),
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
