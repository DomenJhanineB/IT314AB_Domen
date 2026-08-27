import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String ascentName = 'Ascent - Competitive';
String myScore = '12';
String myOponentScore = '14';
String date = '22/08/2026';
String time = '42:01 Min';
String result = 'Defeat';

String image1 = 'assets/images/phoenix.png';
String name1 = 'Syn4pse';
String kda1 = '23/21/6';
String score1 = '261';

String image2 = 'assets/images/sova.png';
String name2 = 'Sova';
String kda2 = '17/21/8';
String score2 = '190';

String image3 = 'assets/images/chamber.png';
String name3 = 'Dabid';
String kda3 = '9/8/1';
String score3 = '89';

String image4 = 'assets/images/clove.png';
String name4 = 'Clove';
String kda4 = '28/23/6';
String score4 = '298';

String image5 = 'assets/images/reyna.png';
String name5 = 'noobsaur';
String kda5 = '21/21/10';
String score5 = '259';

String image6 = 'assets/images/sova.png';
String name6 = 'tlbvay';
String kda6 = '20/18/5';
String score6 = '219';

String image7 = 'assets/images/reyna.png';
String name7 = 'Kreiz';
String kda7 = '18/21/2';
String score7 = '191';

String image8 = 'assets/images/raze.png';
String name8 = 'TranHoang17';
String kda8 = '19/19/4';
String score8 = '203';

String image9 = 'assets/images/cypher.png';
String name9 = 'Neithl';
String kda9 = '23/21/5';
String score9 = '246';

String image10 = 'assets/images/brimstone.png';
String name10 = 'clutch bus cuk';
String kda10 = '13/19/9';
String score10 = '159';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(
          backgroundColor: Colors.black,

          title: const Text(
            'Match Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'My Team',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      myScore,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      myOponentScore,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Opponent',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Stack(
                children: [
                  Image.asset(
                    'assets/images/ascent.png',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    left: 16,
                    bottom: 20,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          ascentName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          '$date  $time',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    right: 16,
                    bottom: 20,

                    child: Text(
                      result,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.grey[900],

                child: Column(
                  children: [
                    const Text(
                      'My Team',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image1,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image2,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name2,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score2,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda2,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image3,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name3,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score3,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda3,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image4,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name4,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score4,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda4,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image5,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name5,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score5,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda5,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const Text(
                      'Opponent',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image6,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name6,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score6,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda6,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image7,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name7,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score7,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda7,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image8,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name8,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score8,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda8,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image9,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name9,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score9,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda9,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[850],

                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              image10,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              name10,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Text(
                            score10,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 30),

                          Text(
                            kda10,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
