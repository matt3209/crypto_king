import 'package:flutter/material.dart';

class CryptoWalletInfo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Wallet Info",
            style: TextStyle(
              color: Colors.orangeAccent,
            ),
          )),
      body: Center(
        child: Column(children: <Widget>[
          //Text on crypto wallet info.
          Image(image: AssetImage('assets/images/map.png')),
          Text(
              'In here we will explain to the user how to setup and login with their crypto wallet. How we will be utilizing their wallet ID\'s within our app.',
              style: TextStyle(fontSize: 18)),
          Text('.', style: TextStyle(fontSize: 18)),
        ]),
      ),
    );
  }
}
