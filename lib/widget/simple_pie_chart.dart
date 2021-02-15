import 'package:app/util/Util.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimplePieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimplePieChart(this.seriesList, {this.animate});

  factory SimplePieChart.withSampleData(List<dynamic> rows) {
    return new SimplePieChart(
      _createSampleData(rows),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData(
      List<dynamic> rows) {
    final data = mapping<LinearSales>(rows, (index, i) {
      return new LinearSales(
          index, int.parse(i['n_mitra'].toString()), HexColor(i['color']));
    }).toList();
    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (LinearSales sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.sales}',
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;
  final Color color;

  LinearSales(this.year, this.sales, this.color);
}
