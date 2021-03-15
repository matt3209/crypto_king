import 'package:crypto_king/gameInfo.dart';
import 'package:flutter/material.dart';
import 'package:crypto_king/buytickets.dart';
import 'package:crypto_king/ticketstats.dart';
import 'package:crypto_king/cryptoinfo.dart';
import 'package:crypto_king/walletlogin.dart';
import 'package:crypto_king/loggedintickets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '0xLOTTO',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Home page for app
  int _counter = 0;
  final tickets = [
    'Your Owned Tickets',
    '0001',
    '0002',
    '0003',
    '0004'
  ]; //temp tickets

  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black87,
                title: Text(
                  "0xLOTTO",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              bottomNavigationBar: menu(), // display bottom menu.
              body: TabBarView(
                children: [
                  Container(
                      child: new Column(
                    children: [
                      new Container(
                          child: Column(children: [
                        Image(
                            image: AssetImage('assets/images/map.png'),
                            height: 100),
                        Text('Previous Lottery Winning Ticket:',
                            style: TextStyle(
                              fontSize: 25,
                            )),
                        Text(
                          '#1111',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text('Enjoy Your Prize',
                            style: TextStyle(fontSize: 25)),
                        Text(
                          'Current Lottery:',
                          style: TextStyle(fontSize: 35),
                        ),
                        Text(
                          '20 Tickets Left for Sale',
                          style: TextStyle(fontSize: 35),
                        ),
                        Text(
                            'Once the last ticket is bought, the lottery will be drawn',
                            style: TextStyle(fontSize: 20)),
                      ])),
                      new Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SecondRoute())); //Take us to buy tickets
                          },
                          child: Text('Buy Tickets'),
                        ),
                      ),
                      new Container(
                          child: Text(
                              'The BUY TICKETS button will only be here if a user IS logged in. Login functionality to come.')),
                      new Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TicketLoggedIn())); //Take us to Licket logged in state.
                          },
                          child: Text('Login'),
                        ),
                      ),
                      new Container(
                          child: Text(
                              'The LOGIN button will only be here if a user IS NOT logged in. When clicked, this takes you to the wallet login. Login functionality to come.')),
                    ],
                  )),
                  Container(
                      child: Column(
                    children: [
                      Container(
                          child: Column(children: <Widget>[
                        Text(
                            'To view your tickets for this lottery please log into your crypto wallet by going to the wallet tab. Login functionality to come.'),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Login'),
                        ),
                      ])),
                      Container(
                          child: Column(children: <Widget>[
                        Text(
                            'Prof Rogers - to view what a user would see when they are actually logged in, click the button below.'),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TicketLoggedIn()));
                          },
                          child: Text('Logged-In User View'),
                        ),
                        Image(image: AssetImage('assets/images/pie-chart.png'))
                      ])),
                    ],
                  )),
                  Container(
                      child: ListView(children: <Widget>[
                    // height: 30,
                    Column(children: <Widget>[
                      Image(image: AssetImage('assets/images/WALLETLINK.png')),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConnectedWallet()));
                        },
                        child: Text('Login'),
                      ),
                      Text(
                          'Prof. Rogers, please click this Login button to see what a Logged in state would appear as. We are currently working on the functionality of switching states.'),
                    ])
                  ])),
                  Container(
                      child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TicketStats()));
                            },
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch, // add this
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image(
                                      image:
                                          AssetImage('assets/images/dots.png'),
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
                      Container(
                        margin: EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameInfo()));
                            },
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch, // add this
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image(
                                      image:
                                          AssetImage('assets/images/map.png'),
                                      // width: 300,
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
                      Container(
                        margin: EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CryptoWalletInfo()));
                            },
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch, // add this
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/cImage.png'),
                                      // width: 300,
                                      height: 150,
                                      fit: BoxFit.fill),
                                ),
                                ListTile(
                                  title: Text('Crypto Wallet Info'),
                                  subtitle:
                                      Text('Learn more about Crypto Wallets'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            )));
  }

  Widget menu() {
    return Container(
      color: Colors.black87,
      child: TabBar(
        labelColor: Colors.orangeAccent[75],
        unselectedLabelColor: Colors.orangeAccent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.orangeAccent,
        tabs: [
          Tab(
            text: "Lottery",
            icon: Icon(Icons.attach_money_sharp),
          ),
          Tab(
            text: "Tickets",
            icon: Icon(Icons.assignment),
          ),
          Tab(
            text: "Wallet",
            icon: Icon(Icons.account_balance_wallet),
          ),
          Tab(
            text: "App Info",
            icon: Icon(Icons.question_answer),
          )
        ],
      ),
    );
  }
}
