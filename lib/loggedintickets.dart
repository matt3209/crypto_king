import 'package:flutter/material.dart';
import 'package:crypto_king/buytickets.dart';

class TicketLoggedIn extends StatelessWidget {
  final tickets = ['Your Owned Tickets', '0001', '0002', '0003', '0004'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              "Crypto King",
              style: TextStyle(
                color: Colors.yellowAccent,
              ),
            )),
        body: Center(
            child: Container(
                child: new Stack(
          children: [
            new Container(
                child: ListView.separated(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tickets[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black,
                );
              },
            )),
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
  /*
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Stack(
      children: [
        new Container(
            child: ListView.separated(
          itemCount: tickets.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tickets[index]),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.black,
            );
          },
        )),
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
    ));
  }
}
*/
