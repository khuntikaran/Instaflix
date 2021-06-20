import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

class Chart extends StatelessWidget {
  Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(enabled: true),
        lineBarsData: [
          LineChartBarData(
            isStrokeCapRound: true,
            spots: [
              FlSpot(0, 0),
              FlSpot(1, 4),
              FlSpot(2, 1),
              FlSpot(3, 3),
              FlSpot(4, 2),
              FlSpot(5, 5)
            ],
            isCurved: true,
            barWidth: 2,
            colors: [
              Colors.orange.shade900,
            ],
            shadow: Shadow(
              offset: Offset(0.5, 0.8),
              color: Colors.orange.shade200,
              blurRadius: 5,
            ),
            belowBarData: BarAreaData(
              gradientFrom: Offset(0, 0.4),
              gradientTo: Offset(0, 0.8),
              show: true,
              colors: [Colors.grey.shade900],
              //  cutOffY: ,
              applyCutOffY: false,
            ),
            dotData: FlDotData(
              show: false,
            ),
          ),
        ],
        minY: 0,
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 5,
            // textStyle: yearTextStyle,
            getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return 'M';
                case 1:
                  return 'T';
                case 2:
                  return 'W';
                case 3:
                  return 'Th';
                case 4:
                  return 'F';
                case 5:
                  return 'Sa';
                case 6:
                  return 'S';

                default:
                  return '';
              }
            },
            getTextStyles: (value) =>
                TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              return '${value + 2}\h';
            },
            getTextStyles: (value) =>
                TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
        ),
        gridData: FlGridData(
          show: false,
          //   checkToShowHorizontalLine: (double value) {
          //   return value == 1 || value == 2 || value == 3 || value == 4;
          //},
        ),
        borderData: FlBorderData(
          show: false,
        ),
      ),
    );
  }
}
