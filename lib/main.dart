import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Capture the Flag 2: Widgets')),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Card(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color.from(
                        alpha: 1,
                        red: 0.263,
                        green: 0.404,
                        blue: 0.616,
                      ),
                      child: Text(
                        'DB',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Domen Jhanine B.',
                      style: TextStyle(
                        fontSize: 30,
                        color: const Color.from(
                          alpha: 1,
                          red: 0.263,
                          green: 0.404,
                          blue: 0.616,
                        ),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        shadows: [Shadow(blurRadius: 3, offset: Offset(1, 1))],
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'BSIT-3',
                      style: TextStyle(
                        fontSize: 22,
                        color: const Color.from(
                          alpha: 1,
                          red: 0.263,
                          green: 0.404,
                          blue: 0.616,
                        ),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      'My First Flutter App',
                      style: TextStyle(
                        fontSize: 21,
                        color: const Color.from(
                          alpha: 1,
                          red: 0.263,
                          green: 0.404,
                          blue: 0.616,
                        ),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      'August 11, 2026',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.from(
                          alpha: 1,
                          red: 0.263,
                          green: 0.404,
                          blue: 0.616,
                        ),
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      'Fact About Me: I Love Doing Makeups',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.from(
                          alpha: 1,
                          red: 0.404,
                          green: 0.404,
                          blue: 0.616,
                        ),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),

                    SizedBox(height: 18),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Text(
                          'Age: 20',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.from(
                              alpha: 1,
                              red: 0.263,
                              green: 0.404,
                              blue: 0.616,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(width: 30),

                        Text(
                          'Birth Date: July 22, 2006',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.from(
                              alpha: 1,
                              red: 0.263,
                              green: 0.404,
                              blue: 0.616,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Card(
                child: Column(
                  children: [
                    Text(
                      'My Favorites',
                      style: TextStyle(
                        fontSize: 26,
                        color: const Color.from(
                          alpha: 1,
                          red: 0.263,
                          green: 0.404,
                          blue: 0.616,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      'Favorite Things i do: Make ups',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.from(
                          alpha: 1,
                          red: 0.263,
                          green: 0.404,
                          blue: 0.616,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Favorite Food: Ham',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.from(
                          alpha: 1,
                          red: 0.263,
                          green: 0.404,
                          blue: 0.616,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Favorite Brand Shoes: Adidas',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.from(
                          alpha: 1,
                          red: 0.263,
                          green: 0.404,
                          blue: 0.616,
                        ),
                      ),
                    ),

                    SizedBox(height: 18),

                    Row(
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

                    SizedBox(height: 15),
                  ],
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
