import 'package:flutter/material.dart';
import 'package:crypto_king/buytickets.dart';

class TicketLoggedIn extends StatelessWidget {
  // this array will become dynamic for each user. for now, we wanted to show
  // you what a user would view when they are logged in. these are the tickets
  // that would display a user 'owns'.
  final tickets = ['Your Owned Tickets', '0001', '0002', '0003', '0004'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              "0xLOTTO",
              style: TextStyle(
                color: Colors.orangeAccent,
              ),
            )),
        body: Center(
            child: Container(
                child: new Stack(
          children: [
            // list of user tickets starts here.
            new Container(
                child: ListView.separated(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tickets[index]), //Displaying tickets user owns.
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black,
                );
              },
            )),

            // this is a button to allow the user to purchase more tickets
            new Container(
              padding: const EdgeInsets.only(top: 515, right: 20.0, left: 300),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondRoute()));
                },
                child: Text('Buy Tickets'),
              ),
            )
          ],
        ))));
  }
}
