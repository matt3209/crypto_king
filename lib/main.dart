import 'package:crypto_king/gameInfo.dart';
import 'package:flutter/material.dart';
import 'package:crypto_king/buytickets.dart';
import 'package:crypto_king/ticketstats.dart';
import 'package:crypto_king/cryptoinfo.dart';
import 'package:crypto_king/walletlogin.dart';
import 'package:crypto_king/loggedintickets.dart';

// Ryan Geisler
// Hunter Hass
// Matt Heider

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
      home: MyHomePage(title: '0xLOTTO'),
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
  int _counter = 0;
  final tickets = [
    'Your Owned Tickets',
    '0001',
    '0002',
    '0003',
    '0004'
  ]; // These are an array of user tickets. This is temporary
  // simply to show for GUI purposes. These tickets will populate
  // automatically from a database upon implementation.

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
                      // container for the 'Lottery' Tab in the nav bar
                      // this is the 'Home' page for the app
                      new Container(
                          child: Column(children: [
                        // main logo image for the home page
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

                      // this container and the next takes the user to purchase tickets on button click
                      // this button will ONLY be here if a user is logged in. if a user is
                      // NOT logged in, the button will be a login button (2nd container below)
                      new Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondRoute()));
                          },
                          child: Text('Buy Tickets'),
                        ),
                      ),
                      new Container(
                          child: Text(
                              'The BUY TICKETS button will only be here if a user IS logged in. Login functionality to come.')),

                      // when a user is not logged in, this is the button that will appear, allowing
                      // the user to login to their wallet.
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

                  // this container holds the 'Tickets' tab information.
                  // if a user is logged in, they will see their list of owned tickets.
                  // if a user is NOT logged in, they will have the option to click a login button
                  // that takes them to the wallet login page.
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

                  // this is the container for the 'Wallet' tab. This tab will allow a user
                  // to login to their crypto wallet. Currently, the 'WalletConnect' screen
                  // is ONLY AN IMAGE. On the backend we need to make this a connected API.
                  Container(
                      child: ListView(children: <Widget>[
                    Column(children: <Widget>[
                      Image(image: AssetImage('assets/images/WALLETLINK.png')),

                      // Clicking the login button below is an example of what the user will see
                      // when their wallet is connected.
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

                  // this is the container for the 'App Info' tab. this tab holds three different
                  // informational cards. card 1 talks about the ticket data, card 2 explains the game,
                  // and card 3 explains how wallets work and we offer pointers on how to create a
                  // wallet and connect a wallet.
                  Container(
                      child: ListView(
                    children: <Widget>[
                      // this is the container for the first card - 'Ticket Sales Data'
                      // when a user clicks this card they can learn more about the tickets sold
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

                      // this is the container for the second card - 'How the Game Works'
                      // when a user clicks this card they can learn more about how our game works
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image(
                                      image:
                                          AssetImage('assets/images/map.png'),
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/cImage.png'),
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

  // this widget build the bottom navigation bar
  // we use orange to match our logo color for the buttons
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
