import 'package:covid19_india_app/data/models/my_state_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color color;
}

class StateCircularChart extends StatelessWidget {
  final MyStateData myStateData;
  const StateCircularChart({Key key, this.myStateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChartData> data = [
      ChartData("Confirmed", myStateData.confirmed, Colors.blueAccent),
      ChartData("Active", myStateData.active, Colors.amberAccent[700]),
      ChartData("Recovered", myStateData.recovered, Colors.greenAccent[700]),
      ChartData("Deaths", myStateData.deaths, Colors.redAccent),
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: SfCircularChart(
        legend: Legend(isVisible: true),
        title: ChartTitle(
            text: "Total Cases", textStyle: TextStyle(color: Colors.black)),
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
              enableTooltip: true,
              dataSource: data,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }
}
