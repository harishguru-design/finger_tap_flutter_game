import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: StartPage());
  }
}

// ================= START PAGE =================

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // BLUE SIDE
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.blueAccent,
              child: Center(
                child: MaterialButton(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(40),
                  color: Colors.white,
                  child: Text("START"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GamePage()),
                    );
                  },
                ),
              ),
            ),
          ),

          // RED SIDE
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.redAccent,
              child: Center(
                child: MaterialButton(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(40),
                  color: Colors.white,
                  child: Text("START"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GamePage()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= GAME PAGE =================

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueHeight = 300;
  double redHeight = 300;

  int playerAScore = 0;
  int playerBScore = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          // PLAYER B
          GestureDetector(
            onTap: () {
              setState(() {
                blueHeight = blueHeight + 30;
                redHeight = redHeight - 30;

                playerBScore = playerBScore + 5;
              });

              if (blueHeight >= screenHeight - 50) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      playerBScore,
                      "PLAYER B WON",
                      Colors.blueAccent,
                    ),
                  ),
                );
              }
            },

            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),

              width: double.infinity,
              height: blueHeight,

              color: Colors.blueAccent,

              child: Padding(
                padding: EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Player B",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),

                    Spacer(),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        playerBScore.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // PLAYER A
          GestureDetector(
            onTap: () {
              setState(() {
                redHeight = redHeight + 30;
                blueHeight = blueHeight - 30;

                playerAScore = playerAScore + 5;
              });

              if (redHeight >= screenHeight - 50) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      playerAScore,
                      "PLAYER A WON",
                      Colors.redAccent,
                    ),
                  ),
                );
              }
            },

            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),

              width: double.infinity,
              height: redHeight,

              color: Colors.redAccent,

              child: Padding(
                padding: EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),

                    Text(
                      "Player A",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        playerAScore.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= RESULT PAGE =================

class ResultPage extends StatelessWidget {
  final int score;
  final String winner;
  final Color color;

  ResultPage(this.score, this.winner, this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text(winner, style: TextStyle(fontSize: 35)),

            SizedBox(height: 20),

            MaterialButton(
              color: Colors.white,

              child: Text("Restart Game"),

              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => StartPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
