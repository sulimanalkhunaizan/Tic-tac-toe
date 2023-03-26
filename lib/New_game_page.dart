// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tic_tac_toe/Game_page.dart';

class newgamepage extends StatefulWidget {
  @override
  State<newgamepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<newgamepage> {
  // to premit the user of entering the names in textfield later to be used in scoreboard
  final TextEditingController playeroneController = TextEditingController();
  final TextEditingController playertwoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("New Game"),
          backgroundColor: Colors.black54,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/NewGame-Theme.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: playeroneController,
                  decoration: InputDecoration(
                    hintText: 'Enter first Player name',
                    prefixIcon: Image.asset('assets/player one.png',
                        width: 10.0, height: 10.0),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                    controller: playertwoController,
                    decoration: InputDecoration(
                        hintText: 'Enter seconed Player name',
                        prefixIcon: Image.asset('assets/player one.png',
                            width: 10.0, height: 10.0),
                        hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ))),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  child: Text("Start Game"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Gamepage(
                          playerOne: playeroneController.text,
                          playerTwo: playertwoController.text,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
