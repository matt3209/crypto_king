import 'package:crypto_king/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crypto_king/buytickets.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class ConnectedWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // this section holds the user's wallet information. there are multiple
    // fields that will return info regarding the wallet status, tickets owned,
    // how much money they've spent, and the number of lotteries participated.
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text("Wallet Login",
                style: TextStyle(
                  color: Colors.orangeAccent,
                ))),
        body: Center(
          child: Column(children: <Widget>[
            Image(
                image: AssetImage(
                    'assets/images/map.png')), //Text that displays user's wallet info, money spent, tickets owned.
            Text(
                'This page represents what a sucessfully connected wallet will look like. When a wallet is connected successfully, the WALLET tab will look like the following:'),
            Text('Wallet ID: 0x898923Hhdkhsas'),
            Text('Total Tickets Owned: 1'),
            Text('USDC: \$100.0'),
            Text('Total Spent: \$1.00'),
            Text('Lotteries Particpated In: 1'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondRoute()));
              },
              child: Text('Purchase More Tickets'),
            ),
            ElevatedButton(
              onPressed: () {
                _signOut();
              },
              child: Text('Logout'),
            ),
            Text(
                'The logout functionality will be coming soon, but when a user logs out it will take them back to the wallet login page. Click it to take you there.'),
          ]),
        ));
  }

  Future<void> _signOut() async {
    await auth.signOut();
    return LoginScreen();
  }
}
