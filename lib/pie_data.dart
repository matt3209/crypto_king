import 'package:flutter/material.dart';

import 'package:crypto_king/index.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:numberpicker/numberpicker.dart';

double getIndex() {
  double currIndex = 10;
  return currIndex;
}



class PieData {
  static List<Data> data = [
    Data(
        name: 'Purchased',
        percent:  globalIndex.toDouble(),
        color: const Color(0xff0293ee)),
    Data(
        name: 'Remaining',
        percent: (100.00 - globalIndex.toDouble()),
        color: const Color(0xfff8b250)),
  ];
}

class Data {
  final String name;
  //double index  = _getIndex();
  final double percent;

  final Color color;

  Data({this.name, this.percent, this.color});
}
