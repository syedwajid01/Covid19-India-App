import 'package:covid19_india_app/data/models/my_state_single_value.dart';
import 'package:covid19_india_app/misc/helper.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StateDailyChart2 extends StatelessWidget {
  final Map<String, List<MyStateSingleValue>> stateDailydata;
  const StateDailyChart2({Key key, this.stateDailydata}) : super(key: key);

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
        title: ChartTitle(text: "Daily Confirmed Cases"),
        tooltipBehavior: TooltipBehavior(enable: true,),
        series: <ChartSeries<MyStateSingleValue, String>>[
          ColumnSeries<MyStateSingleValue, String>(
            dataSource:
                stateDailydata['cnf_state_daily_data'].reversed.toList(),
            xValueMapper: (MyStateSingleValue data, _) =>
                Helper.formateDateDDMMMYY(data.date),
            yValueMapper: (MyStateSingleValue data, _) => data.value,
            color: Colors.blue,
            enableTooltip: true,
          ),
        ],
      ),
    );
  }
}
