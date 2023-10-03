import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BidBarChart extends StatelessWidget {
  final List<List<String>> bids;

  const BidBarChart({super.key, required this.bids});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        BarSeries<List<String>, String>(
          dataSource: bids,
          xValueMapper: (List<String> bid, _) => bid[0], // Price
          yValueMapper: (List<String> bid, _) =>
              double.parse(bid[1]), // Quantity
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
