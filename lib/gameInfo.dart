import 'package:flutter/material.dart';

class GameInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Game Info",
            style: TextStyle(
              color: Colors.orangeAccent,
            ),
          )),
      body: Center(
        child: Column(children: <Widget>[
          //Text on game info page.
          Image(image: AssetImage('assets/images/map.png')),
          Text(
              'We will have images and paragraphs to help the user understand how the game works.',
              style: TextStyle(fontSize: 18)),
          Text(
              'The game consists of users logging in with crypto wallet that they already have made. They will then buy tickets with USD Crypto Coin not USD Dollar.',
              style: TextStyle(fontSize: 18)),
          Text(
              'After all of the lottery tickets are bought we will generate a random win based on a random ticket being chosen.',
              style: TextStyle(fontSize: 18)),
          Text(
              'The winning lottery ticket winner will then be awarded USD coin which would be half the pot and also a custom NFT from us.',
              style: TextStyle(fontSize: 18))
        ]),
      ),
    );
  }
}
