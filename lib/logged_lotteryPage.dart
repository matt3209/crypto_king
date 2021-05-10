import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_king/buytickets.dart';
import 'package:crypto_king/gameInfo.dart';
import 'package:crypto_king/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:crypto_king/indicators_widget.dart';
import 'package:crypto_king/pie_chart_sections.dart';

class LotteryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

_buyTickets(int num) async {
  CollectionReference tickets =
      FirebaseFirestore.instance.collection('tickets');

  await tickets.doc('number').update({'Winning Ticket': num});
}



class PieChartPageState extends State<LotteryPage> {
  var _currentUID = FirebaseAuth.instance.currentUser.uid;
  var winningTicket = 0;
  var winner = false;
  var currentIndex = 0;
  int touchedIndex;
  var arrayTest = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Image(
                    image: AssetImage('assets/images/map.png'), height: 150),
              ),
              Column(children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('tickets')
                        .doc('number')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return new Text("Loading");
                      }
                      var userDocument = snapshot.data;
                      winningTicket = userDocument['Winning Ticket'];
                      currentIndex = userDocument['index'];
                      globalIndex = userDocument['index'];
                      if (winningTicket == 0 && currentIndex >= 101) {
                        Random random = new Random();
                        winningTicket = random.nextInt(100) + 1;
                        _buyTickets(winningTicket);
                        // arraytest = _displayWinner(winningTicket);
                      }
                      //return new Text(userDocument["First Name"]);
                      return Column(children: [
                        Text(
                            winningTicket > 0
                                ? "The winning ticket is: $winningTicket "
                                : 'Tickets are still available',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text(
                            winningTicket == 0
                                ? "Tickets Available: ${101 - userDocument['index']}"
                                : '',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))
                      ]);
                    }),
              ]),
              Container(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(_currentUID)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return new Text("Loading");
                        }

                        if (winningTicket > 0 && currentIndex >= 101) {
                          var dataValues = snapshot.data;
                          arrayTest = dataValues['Ticket List'];
                          arrayTest.forEach((value) {
                            if (value == winningTicket) winner = true;
                          });
                        }
                        //return new Text(userDocument["First Name"]);
                        return Column(children: [
                          Text(
                              winningTicket == 0
                                  ? ''
                                  : winner
                                      ? 'Game Over: You are the winner!'
                                      : 'Game Over: You are not the winner.',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold))
                        ]);
                      })),
              Container(
                padding: EdgeInsets.all(15),
                child: Image.network(
                    'https://media.giphy.com/media/l378khQxt68syiWJy/source.gif'),
              ),
              Container(
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondRoute()));
                  },
                  child: Text('Get Tickets'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GameInfo()));
                  },
                  child: Text('How To Play The Game'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<int> _getIndex() async {
    CollectionReference tickets =
        FirebaseFirestore.instance.collection('tickets');
    DocumentSnapshot currentIndex = await tickets.doc('number').get();
    int index = currentIndex['index'];
    return index;
  }
}
