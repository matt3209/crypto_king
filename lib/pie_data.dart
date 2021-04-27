import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:numberpicker/numberpicker.dart';

//double index = _getIndexHelper();
/*
_getIndex() async {
  CollectionReference tickets =
      FirebaseFirestore.instance.collection('tickets');

  DocumentSnapshot currentIndex = await tickets.doc('number').get();
  var indexOne = currentIndex['index'];
  //await Future.wait(index);
  return indexOne;
}

_getIndexHelper() async {
  int whatever = await _getIndex();
  return whatever;
}

double getSecureValue() {
  double test = _getIndex();
  return test;

Thihoiahishdihaiohfioashiofhaidhsfoihaioshdf

}
*/

double getIndex() {
  double currIndex = 10;
  return currIndex;
}

class PieData {
  static List<Data> data = [
    Data(
        name: 'Purchased', percent: getIndex(), color: const Color(0xff0293ee)),
    Data(
        name: 'Remaining',
        percent: (100.00 - getIndex()),
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
