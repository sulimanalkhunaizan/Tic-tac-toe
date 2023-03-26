// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Gamepage extends StatefulWidget {
  //players name
  final String playerOne;
  final String playerTwo;
  Gamepage({
    super.key,
    required this.playerOne,
    required this.playerTwo,
  });

  @override
  State<Gamepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Gamepage> {
  late Timer timer;
  static const countdown = 90;
  int seconds = countdown;
  bool x_turn = true;
  List<String> displaywhen = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
  ];
  // X & O scores and it will increment if either one them wins
  int xScore = 0;
  int oScore = 0;

  void StartTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        }
      });
    });
  }

  void StopTimer() {
    timer.cancel();
  }

  void ResetTimer() {
    seconds = countdown;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Scoreboard",
            style: GoogleFonts.pressStart2p(),
          ),
        ),
        body: Column(
          children: [
            // Text('$timeRemaining seconds left'),
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Player : ${widget.playerOne}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          '$xScore',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Player : ${widget.playerTwo}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text(
                          '$oScore',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
                //to set the layout of the game
                child: GridView.builder(
                    //here is set to be 9 grids --> item count & we set the column to be 3 --> crossaxiscount
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          whentapped(index);
                        },
                        child: Container(
                            //to set the border of the grids
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87)),
                            child: Center(
                              child: Text(displaywhen[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 40)),
                            )),
                      );
                    }))
          ],
        ),
        //button to refreash the game without reseting the score
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              resetGame();
            },
            child: Icon(Icons.refresh)));
  }

  // to alternate between X & O when tapped and each time we check weather the player has won
  void whentapped(int grid) {
    setState(() {
      if (x_turn) {
        displaywhen[grid] = "X";
      } else {
        displaywhen[grid] = "O";
      }
      x_turn = !x_turn;
      iswinner();
    });
  }

//method to check all possibility of winning
  void iswinner() {
    //first possibility
    if (displaywhen[0] == displaywhen[1] &&
        displaywhen[0] == displaywhen[2] &&
        displaywhen[0] != " ") {
      winner(displaywhen[0]);
    }
    //seconed possibility
    if (displaywhen[0] == displaywhen[3] &&
        displaywhen[0] == displaywhen[6] &&
        displaywhen[0] != " ") {
      winner(displaywhen[0]);
    }
    //third possibility
    if (displaywhen[0] == displaywhen[4] &&
        displaywhen[0] == displaywhen[8] &&
        displaywhen[0] != " ") {
      winner(displaywhen[0]);
    } //fourth possibility
    if (displaywhen[1] == displaywhen[4] &&
        displaywhen[1] == displaywhen[7] &&
        displaywhen[1] != " ") {
      winner(displaywhen[1]);
    }
    //fifth possibility
    if (displaywhen[2] == displaywhen[4] &&
        displaywhen[2] == displaywhen[6] &&
        displaywhen[2] != " ") {
      winner(displaywhen[2]);
    }
    //sixth possibility
    if (displaywhen[2] == displaywhen[5] &&
        displaywhen[2] == displaywhen[8] &&
        displaywhen[2] != " ") {
      winner(displaywhen[2]);
    } //seventh possibility
    if (displaywhen[3] == displaywhen[4] &&
        displaywhen[3] == displaywhen[5] &&
        displaywhen[3] != " ") {
      winner(displaywhen[3]);
    }
    //eighth possibility
    if (displaywhen[6] == displaywhen[7] &&
        displaywhen[6] == displaywhen[8] &&
        displaywhen[6] != " ") {
      winner(displaywhen[6]);
    }
  }

  //method to increment the score
  void winner(String winner) {
    if (winner == "X") {
      xScore++;
    } else {
      oScore++;
    }
    //massage appear when winning and it will specify the winner by his symbol X or O
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text("Game over"),
            content: Text("the winner is " + winner),
          );
        });
  }

//method to reset the game without deleting the Score
  void resetGame() {
    setState(() {
      //resting the game by taking the intial form of the list
      displaywhen = [
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
      ];
      // Reset the x_turn variable
      x_turn = true;
    });
  }
}

// void startTimer() {
//   timer = Timer.periodic(Duration(seconds: 1), (timer) {
//     setState(() {
//       if (countdownTime < 1) {
//         timer.cancel();
//         // handle timeout here
//       } else {
//         countdownTime = countdownTime - 1;
//       }
//     });
//   });
// }
