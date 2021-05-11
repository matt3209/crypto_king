import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const urlCoinbase = 'https://www.coinbase.com/';
const urlGemini = 'https://www.gemini.com/';
const urlBinance = 'https://www.binance.com/en';

class CryptoWalletInfo extends StatelessWidget {
  Widget build(BuildContext context) {
    // this page in our app will have our logo and include some infographics
    // to help explain how crypto wallets work, how to choose one, and
    // how to connect to our app.
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Crypto Wallet Information",
            style: TextStyle(
              color: Colors.orangeAccent,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          Column(
            children: [
              Image(image: AssetImage('assets/images/map.png')),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                    'Crypto wallets are a way for you to store your private keys – passwords that give you access to your digital assets on the blockchain – in an extremely safe place. From this wallet, you can send and receive digital assets that are on the blockchain. Below are our top three recommended wallets to get started.',
                    textAlign: TextAlign.justify),
              ),

              // COINBASE WALLET CARD START
              Card(
                color: Colors.orange[200],
                elevation: 5,
                shadowColor: Colors.orange,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      title: Text('Coinbase'),
                      subtitle: Text('Most Popular: Easy for all users.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            _launchURL(urlCoinbase);
                          },
                          child: const Text('Get Wallet'),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),

              //GEMINI WALLET START
              Card(
                color: Colors.orange[200],
                elevation: 5,
                shadowColor: Colors.orange,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      title: Text('Gemini'),
                      subtitle: Text('An excellent solution for new users.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Get Wallet'),
                          onPressed: () {
                            _launchURL(urlGemini);
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),

              // BINANCE START
              Card(
                color: Colors.orange[200],
                elevation: 5,
                shadowColor: Colors.orange,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      title: Text('Binance'),
                      subtitle: Text(
                          'Beginners and experts alike will enjoy Binance.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Get Wallet'),
                          onPressed: () {
                            _launchURL(urlBinance);
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  // method to help launch the URL when the user clicks on a link to
  // go to a crypto wallet page
  void _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
