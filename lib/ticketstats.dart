import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:crypto_king/indicators_widget.dart';
import 'package:crypto_king/pie_chart_sections.dart';

// this class builds and displays the ticket stats.

class TicketStats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              "0xLOTTO",
              style: TextStyle(
                color: Colors.orangeAccent,
              ),
            )),
        body:

            // pie chart data
            Center(
          child: Column(children: <Widget>[
            Expanded(
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
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
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: IndicatorsWidget(),
              )
            ]),
          ]),
        ));
  }
}
