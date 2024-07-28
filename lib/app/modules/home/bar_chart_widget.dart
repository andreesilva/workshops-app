import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:workshops_app/app/data/models/sprice_point.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget(
      {Key? key, required this.points, required String collaborator})
      : super(key: key);

  final List<PricePoint> points;

  @override
  State<BarChartWidget> createState() =>
      _BarChartWidgetState(points: this.points, collaborator: this.toString());
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final List<PricePoint> points;
  final String collaborator;

  _BarChartWidgetState({required this.points, required this.collaborator});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          barGroups: _chartGroups(),
          borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), left: BorderSide())),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return points
        .map((point) => BarChartGroupData(
            x: point.x.toInt(), barRods: [BarChartRodData(toY: point.y)]))
        .toList();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Jan';
              break;
            case 2:
              text = 'Mar';
              break;
            case 4:
              text = 'May';
              break;
            case 6:
              text = 'Jul';
              break;
            case 8:
              text = 'Sep';
              break;
            case 10:
              text = 'Nov';
              break;
          }

          return Text(text);
        },
      );
}
