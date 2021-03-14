import 'package:flutter/material.dart';
import 'package:crypto_king/buytickets.dart';
import 'package:crypto_king/ticketstats.dart';
import 'package:crypto_king/cryptoinfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.`
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //this is a note
        primarySwatch: Colors.blue,
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
  int _counter = 0;
  final tickets = ['User\'s Tickets', '0001', '0002', '0003', '0003'];

  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightBlueAccent[700],
                title: Text("Crypto King"),
              ),
              bottomNavigationBar: menu(),
              body: TabBarView(
                children: [
                  Container(
                      child: new Column(
                    children: [
                      new Container(
                          child: Column(children: [
                        Text('The winning lottery ticket is...')
                      ])),
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
                      )
                    ],
                  )),
                  Container(
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
                        padding: const EdgeInsets.only(
                            top: 515, right: 20.0, left: 300),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondRoute()));
                          },
                          child: Text('Buy Tickets'),
                        ),
                      )
                    ],
                  )),
                  Container(
                      height: 30,
                      child: Column(children: <Widget>[
                        Image(
                            image: AssetImage('assets/images/WALLETLINK.png')),
                        ElevatedButton(onPressed: null, child: Text('Login'))
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
                                      builder: (context) => SecondRoute()));
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
                                  child: Image.network(
                                      'https://placeimg.com/640/480/any',
                                      // width: 300,
                                      height: 150,
                                      fit: BoxFit.fill),
                                ),
                                ListTile(
                                  title: Text('How the Game Works'),
                                  subtitle:
                                      Text('Click here to learn more about '),
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
                                  child: Image.network(
                                      'https://placeimg.com/640/480/any',
                                      // width: 300,
                                      height: 150,
                                      fit: BoxFit.fill),
                                ),
                                ListTile(
                                  title: Text('Crypto Wallet Info'),
                                  subtitle: Text('Learn more about Wallets'),
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
      color: Colors.lightBlueAccent[700],
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.black,
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
            text: "Info",
            icon: Icon(Icons.question_answer),
          )
        ],
      ),
    );
  }
}
