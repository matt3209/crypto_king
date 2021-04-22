import 'package:flutter/material.dart';

class GameInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Game Info",
            style: TextStyle(
              color: Colors.orangeAccent,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/map.png')),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                  'Blockchain technology has solidified itself in our world. We at OxLOTTO understand this new technology and all its terms – cryptocurrency, coins, Non-Fungible Tokens (NFT) , HODL, among many others – can feel overwhelming. Our app\'s intention is to provide a free, safe environment to help users learn more about crypto, and in the process, offer them a chance to win a custom NFT to celebrate their new endeavor into cryptocurrency and the blockchain. Here’s how it works:',
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                  'Users sign up to join OxLOTTO with an email, some personal details, and a cryptocurrency wallet address. This address is the crucial piece in the lottery. Each “lottery”, users can acquire up to five (5) tickets each. Once all the tickets have been claimed, the lucky lottery ticket number is drawn. Whoever owns the winning ticket is then sent an NFT to their crypto wallet!',
                  textAlign: TextAlign.justify),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                  'It really is that simple. Signup, play for free, and earn a shot at an NFT. Thanks for using the OxLOTTO app – have fun, and good luck!',
                  textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
    );
  }
}
