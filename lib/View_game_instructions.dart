// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Viewgameinstructions extends StatelessWidget {
  const Viewgameinstructions({super.key});

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Instructions of the game'),
        backgroundColor: Colors.black87,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          ListTile(
            leading: Text('1.'),
            title: Text('The game is played on a 3x3 grid.'),
          ),
          ListTile(
            leading: Text('2.'),
            title: Text(
                'Player 1 starts by placing their symbol (X) on the grid.'),
          ),
          ListTile(
            leading: Text('3.'),
            title: Text('Player 2 (O) then places their symbol on the grid.'),
          ),
          ListTile(
            leading: Text('4.'),
            title: Text(
                'Players take turns until one of them gets three in a row, either horizontally, vertically or diagonally.'),
          ),
          ListTile(
            leading: Text('5.'),
            title: Text(
                'If the grid is filled and no player has three in a row, the game ends in a tie.'),
          ),
        ],
      ),
    );
  }
}
