// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tic_tac_toe/New_game_page.dart';
import 'package:tic_tac_toe/View_game_instructions.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              )
            ]),
        appBar: AppBar(
          title: Text(
            "Tic tac toe game",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black54,
          elevation: 0,
        ),

        // ignore: prefer_const_literals_to_create_immutables

        // to set the background to an image
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the new game page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => newgamepage()),
                      );
                    },
                    //button for New game
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    child: Text('New Game'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the instructions page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Viewgameinstructions()),
                      );
                    },
                    //button for instructions
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange)),
                    child: Text(
                      "View Game instructions",
                    ),
                  )
                ]))));
  }
}
