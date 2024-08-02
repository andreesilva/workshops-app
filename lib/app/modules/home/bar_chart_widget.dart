import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:workshops_app/app/data/models/collaborator.dart';

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

  print(CollaboratorModel collaborator) {}

  _BarChartWidgetState({required this.points, required this.collaborator});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(fromY: 0, toY: 8, width: 15, color: Colors.amber)
            ]),
          ],
          borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), left: BorderSide())),
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) => Text('Workshop(s)')),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = 'Colobator: $collaborator';

          return Text(text);
        },
      );
}
