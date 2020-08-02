import 'package:covid19_india_app/data/models/my_state_single_value.dart';
import 'package:covid19_india_app/misc/helper.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StateDailyChart extends StatelessWidget {
  final Map<String, List<MyStateSingleValue>> stateDailydata;
  const StateDailyChart({Key key, this.stateDailydata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        zoomPanBehavior: ZoomPanBehavior(
          enableDoubleTapZooming: true,
          enablePanning: true,
          zoomMode: ZoomMode.x,
          enableMouseWheelZooming: true,
          enablePinching: true,
        ),
        title: ChartTitle(text: "Daily"),
        legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap,
            alignment: ChartAlignment.center),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <LineSeries<MyStateSingleValue, String>>[
          LineSeries<MyStateSingleValue, String>(
            dataSource:
                stateDailydata['cnf_state_daily_data'].reversed.toList(),
            xValueMapper: (MyStateSingleValue data, _) =>
                Helper.formateDateDDMMMYY(data.date),
            yValueMapper: (MyStateSingleValue data, _) => data.value,
            color: Colors.blue,
            legendItemText: "Confirmed",
            enableTooltip: true,
            legendIconType: LegendIconType.circle,
          ),
          LineSeries<MyStateSingleValue, String>(
            dataSource:
                stateDailydata['rcvrd_state_daily_data'].reversed.toList(),
            xValueMapper: (MyStateSingleValue data, _) =>
                Helper.formateDateDDMMMYY(data.date),
            yValueMapper: (MyStateSingleValue data, _) => data.value,
            color: Colors.green,
            legendItemText: "Recovered",
            legendIconType: LegendIconType.circle,
          ),
          LineSeries<MyStateSingleValue, String>(
            dataSource:
                stateDailydata['deaths_state_daily_data'].reversed.toList(),
            xValueMapper: (MyStateSingleValue data, _) =>
                Helper.formateDateDDMMMYY(data.date),
            yValueMapper: (MyStateSingleValue data, _) => data.value,
            color: Colors.red,
            legendItemText: "Deceased",
            legendIconType: LegendIconType.circle,
          ),
          LineSeries<MyStateSingleValue, String>(
            dataSource:
                stateDailydata['active_state_daily_data'].reversed.toList(),
            xValueMapper: (MyStateSingleValue data, _) =>
                Helper.formateDateDDMMMYY(data.date),
            yValueMapper: (MyStateSingleValue data, _) => data.value,
            color: Colors.amberAccent[700],
            legendItemText: "Active",
            legendIconType: LegendIconType.circle,
          ),
        ],
      ),
    );
  }
}
