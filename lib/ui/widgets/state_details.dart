import 'package:covid19_india_app/bloc/state_detail_bloc.dart';
import 'package:covid19_india_app/data/models/my_state_data.dart';
import 'package:covid19_india_app/misc/helper.dart';
import 'package:covid19_india_app/ui/widgets/state_circular_chart.dart';
import 'package:covid19_india_app/ui/widgets/state_cumulative_chart.dart';
import 'package:covid19_india_app/ui/widgets/state_daily_chart1.dart';
import 'package:covid19_india_app/ui/widgets/state_daily_chart2.dart';
import 'package:covid19_india_app/ui/widgets/state_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loading.dart';
import 'no_data.dart';

class StateDetails extends StatelessWidget {
  final MyStateData stateData;
  const StateDetails({Key key, @required this.stateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 0.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 12.0,
                ),
                child: Text(
                  "Last Updated: " +
                      Helper.parseAndFormatDateFull(stateData.lastUpdatedTime),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withBlue(100).withAlpha(150),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: StateSummaryCard(
                  cardColor: Colors.blueAccent,
                  lastUpdatedTime: stateData.lastUpdatedTime,
                  todayChange: stateData.todayConfirmed,
                  totalValue: stateData.confirmed,
                  name: "Confirmed",
                )),
                Expanded(
                  child: StateSummaryCard(
                    cardColor: Colors.amberAccent[700],
                    lastUpdatedTime: stateData.lastUpdatedTime,
                    todayChange: stateData.todayConfirmed -
                        stateData.todayRecovered -
                        stateData.todayDeaths,
                    totalValue: stateData.active,
                    name: "Active",
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: StateSummaryCard(
                  cardColor: Colors.greenAccent[700],
                  lastUpdatedTime: stateData.lastUpdatedTime,
                  todayChange: stateData.todayRecovered,
                  totalValue: stateData.recovered,
                  name: "Recovered",
                )),
                Expanded(
                  child: StateSummaryCard(
                    cardColor: Colors.redAccent,
                    lastUpdatedTime: stateData.lastUpdatedTime,
                    todayChange: stateData.todayDeaths,
                    totalValue: stateData.deaths,
                    name: "Deaths",
                  ),
                ),
              ],
            ),
            BlocBuilder<StateDetailBloc, StateDetailState>(
              builder: (context, state) {
                if (state is StateDetailInitial) {
                  BlocProvider.of<StateDetailBloc>(context)
                      .add(GetStateDetailData(stateCode: stateData.stateCode));
                  return buildLoadingScreen();
                }
                if (state is StateDetailLoading) {
                  return buildLoadingScreen();
                }
                if (state is StateDetailLoaded) {
                  return Column(
                    children: <Widget>[
                      stateChart(
                          context: context,
                          child: StateCircularChart(
                            myStateData: stateData,
                          )),
                      stateChart(
                        context: context,
                        child: StateDailyChart(
                          stateDailydata: state.patientDataMap,
                        ),
                      ),
                      stateChart(
                        context: context,
                        child: StateCumulative(
                          stateDailydata: state.patientDataMap,
                        ),
                      ),
                      stateChart(
                        context: context,
                        child: StateDailyChart2(
                          stateDailydata: state.patientDataMap,
                        ),
                      )
                    ],
                  );
                }
                if (state is StateDetailError) {
                  return buildNoDataScreen();
                }
                return buildLoadingScreen();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoadingScreen() {
    return Loading();
  }

  Widget buildNoDataScreen() {
    return NoData();
  }

  Widget stateChart({BuildContext context, Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Container(
          margin: EdgeInsets.only(
            top: 16,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.blueAccent.withOpacity(0.25),
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: child),
    );
  }
}
