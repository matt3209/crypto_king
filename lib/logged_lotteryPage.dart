import 'package:crypto_king/buytickets.dart';
import 'package:flutter/material.dart';

class LotteryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(children: [
        Container(
            child: new Column(
          children: [
            // container for the 'Lottery' Tab in the nav bar
            // this is the 'Home' page for the app
            new Container(
                child: Column(children: [
              // main logo image for the home page
              Image(image: AssetImage('assets/images/map.png'), height: 100),
              Text('Previous Lottery Winning Ticket:',
                  style: TextStyle(
                    fontSize: 25,
                  )),
              Text(
                '#1111',
                style: TextStyle(fontSize: 40),
              ),
              Text('Enjoy Your Prize', style: TextStyle(fontSize: 25)),
              Text(
                'Current Lottery:',
                style: TextStyle(fontSize: 35),
              ),
              Text(
                '20 Tickets Left for Sale',
                style: TextStyle(fontSize: 35),
              ),
              Text('Once the last ticket is bought, the lottery will be drawn',
                  style: TextStyle(fontSize: 20)),
            ])),

            // this container and the next takes the user to purchase tickets on button click
            // this button will ONLY be here if a user is logged in. if a user is
            // NOT logged in, the button will be a login button (2nd container below)
            new Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondRoute()));
                },
                child: Text('Get Tickets'),
              ),
            ),
            new Container(
                child: Text(
                    'The GET TICKETS button will only be here if a user IS logged in. Login functionality to come.')),
          ],
        )),
      ])),
    );
  }
}
