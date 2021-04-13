import 'package:crypto_king/gameInfo.dart';
import 'package:crypto_king/logged_AppInfo.dart';
import 'package:crypto_king/logged_WalletPage.dart';
import 'package:crypto_king/logged_lotteryPage.dart';
import 'package:crypto_king/logged_tickets.dart';
import 'package:crypto_king/login.dart';
import 'package:flutter/material.dart';
import 'package:crypto_king/buytickets.dart';
import 'package:crypto_king/ticketstats.dart';
import 'package:crypto_king/cryptoinfo.dart';
import 'package:crypto_king/walletlogin.dart';
import 'package:crypto_king/loggedintickets.dart';
import 'package:firebase_core/firebase_core.dart';

// Ryan Geisler
// Hunter Hass
// Matt Heider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(accentColor: Colors.orange, primarySwatch: Colors.blue),
      home: LoginScreen(), //Loading login screen
    );
  }
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
  final tickets = ['Your Owned Tickets', '0001', '0002', '0003', '0004'];
  // These are an array of user tickets. This is temporary
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
                  LotteryPage(),
                  // this container holds the 'Tickets' tab information.
                  // if a user is logged in, they will see their list of owned tickets.
                  // if a user is NOT logged in, they will have the option to click a login button
                  // that takes them to the wallet login page.
                  LotteryTickets(),
                  // this is the container for the 'Wallet' tab. This tab will allow a user
                  // to login to their crypto wallet. Currently, the 'WalletConnect' screen
                  // is ONLY AN IMAGE. On the backend we need to make this a connected API.
                  WalletPage(),
                  // this is the container for the 'App Info' tab. this tab holds three different
                  // informational cards. card 1 talks about the ticket data, card 2 explains the game,
                  // and card 3 explains how wallets work and we offer pointers on how to create a
                  // wallet and connect a wallet.
                  AppInfoPage(),
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
