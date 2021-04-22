import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: 'Purchased', percent: 96, color: const Color(0xff0293ee)),
    Data(name: 'Remaining', percent: 4, color: const Color(0xfff8b250)),
  ];
}

class Data {
  final String name;

  final double percent;

  final Color color;

  Data({this.name, this.percent, this.color});
}
