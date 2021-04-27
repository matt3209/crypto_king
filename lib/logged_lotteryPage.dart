import 'package:crypto_king/buytickets.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:crypto_king/indicators_widget.dart';
import 'package:crypto_king/pie_chart_sections.dart';

class LotteryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State<LotteryPage> {
  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Image(
                    image: AssetImage('assets/images/map.png'), height: 100),
              ),
              Container(
                child: Text('Previous Lottery Winning Ticket:',
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ),
              Container(
                height: 200.0,
                width: 200.0,
                child: Text(
                    'Hellodfdddddddddddddddddddddddddddddddddddddd'),
              ),
              Container(
                child: Column(children: <Widget>[
                  PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (pieTouchResponse) {
                          setState(() {
                            if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                pieTouchResponse.touchInput is FlPanEnd) {
                              touchedIndex = -1;
                            } else {
                              touchedIndex =
                                  pieTouchResponse.touchedSectionIndex;
                            }
                          });
                        },
                      ),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: getSections(touchedIndex),
                    ),
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: IndicatorsWidget(),
                    )
                  ]),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//         child: Column(children: <Widget>[
//           Expanded(
//             child: PieChart(
//               PieChartData(
//                 pieTouchData: PieTouchData(
//                   touchCallback: (pieTouchResponse) {
//                     setState(() {
//                       if (pieTouchResponse.touchInput is FlLongPressEnd ||
//                           pieTouchResponse.touchInput is FlPanEnd) {
//                         touchedIndex = -1;
//                       } else {
//                         touchedIndex = pieTouchResponse.touchedSectionIndex;
//                       }
//                     });
//                   },
//                 ),
//                 borderData: FlBorderData(show: false),
//                 sectionsSpace: 0,
//                 centerSpaceRadius: 40,
//                 sections: getSections(touchedIndex),
//               ),
//             ),
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: IndicatorsWidget(),
//             )
//           ]),
//         ]),
//       ),
//     );
//   }
// }
