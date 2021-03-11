import 'package:flutter/material.dart';
import 'buytickets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
                  child: Center(
                      child: Text(
                'The Winning Lottery Number is: ',
                textAlign: TextAlign.center,
                textScaleFactor: 3,
              ))),
              //ElevatedButton(onPressed: null, child: Text('hello')),
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
                    padding:
                        const EdgeInsets.only(top: 5, right: 20.0, left: 300),
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('Buy Tickets'),
                    ),
                  )
                ],
              )),
              Container(
                  padding:
                      const EdgeInsets.only(top: 5, right: 20.0, left: 300),
                  child: ElevatedButton(onPressed: null, child: Text('Login'))),
              Container(
                  child: Center(
                      child: Text(
                'THIS IS WHERE WE WILL HAVE INFORMATION SO PEOPLE KNOW WHAT IS GOING ON.',
                textAlign: TextAlign.center,
                textScaleFactor: 3,
              )))
            ],
          ),
        ),
      ),
    );
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
