import 'package:crypto_king/loggedintickets.dart';
import 'package:flutter/material.dart';

class LotteryTickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: Column(
      children: [
        Container(
            child: Column(children: <Widget>[
          Text(
              'Dog'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TicketLoggedIn()));
            },
            child: Text('Logged-In User View'),
            style: ElevatedButton.styleFrom(onPrimary: Colors.orangeAccent, // background
          primary: Colors.black, // foreground
          ),
          ),
          Image(image: AssetImage('assets/images/pie-chart.png'))
        ])),
      ],
    ))));
  }
}
