import 'package:crypto_king/walletlogin.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: ListView(children: <Widget>[
      Column(children: <Widget>[
        Image(image: AssetImage('assets/images/WALLETLINK.png')),

        // Clicking the login button below is an example of what the user will see
        // when their wallet is connected.
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConnectedWallet()));
          },
          child: Text('Login'),
        ),
        Text(
            'Prof. Rogers, please click this Login button to see what a Logged in state would appear as. We are currently working on the functionality of switching states.'),
      ])
    ]))));
  }
}
