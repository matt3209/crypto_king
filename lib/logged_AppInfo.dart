import 'package:crypto_king/cryptoinfo.dart';
import 'package:crypto_king/gameInfo.dart';
import 'package:crypto_king/ticketstats.dart';
import 'package:flutter/material.dart';

class AppInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: ListView(
      children: <Widget>[
        // this is the container for the first card - 'Ticket Sales Data'
        // when a user clicks this card they can learn more about the tickets sold
        Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TicketStats()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image(
                        image: AssetImage('assets/images/dots.png'),
                        // width: 300,
                        height: 150,
                        fit: BoxFit.fill),
                  ),
                  ListTile(
                    title: Text('Ticket Sales Data'),
                    subtitle: Text(
                        'Click here to learn more about the number of tickets sold and the number of tickets still available'),
                  ),
                ],
              ),
            ),
          ),
        ),

        // this is the container for the second card - 'How the Game Works'
        // when a user clicks this card they can learn more about how our game works
        Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameInfo()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image(
                        image: AssetImage('assets/images/map.png'),
                        height: 150,
                        fit: BoxFit.fill),
                  ),
                  ListTile(
                    title: Text('How the Game Works'),
                    subtitle: Text(
                        'Click here to learn more about the Crypto King\'s Lottery'),
                  ),
                ],
              ),
            ),
          ),
        ),

        // this is the container for the third card - 'Crypto Wallet Info'
        // when a user clicks this card they can learn more about the tickets sold
        Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CryptoWalletInfo()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image(
                        image: AssetImage('assets/images/cImage.png'),
                        height: 150,
                        fit: BoxFit.fill),
                  ),
                  ListTile(
                    title: Text('Crypto Wallet Info'),
                    subtitle: Text('Learn more about Crypto Wallets'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ))));
  }
}
