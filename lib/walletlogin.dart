import 'package:flutter/material.dart';
import 'package:crypto_king/buytickets.dart';

class ConnectedWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text("Wallet Login",
                style: TextStyle(
                  color: Colors.orangeAccent,
                ))),
        body: Center(
          child: Column(children: <Widget>[
            Image(image: AssetImage('assets/images/map.png')),
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
          ]),
        ));
  }
}
