import 'package:covid19_india_app/data/models/my_state_data.dart';
import 'package:flutter/material.dart';

class StateListTile extends StatelessWidget {
  final MyStateData stateData;
  StateListTile({
    Key key,
    this.stateData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                stateData.state,
                style: TextStyle(
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              stateTileRow(
                title: "Active",
                todayCases: stateData.todayActive.toString(),
                totalCases: stateData.active.toString(),
                color: Colors.grey,
              ),
              stateTileRow(
                title: "Confirmed",
                todayCases: stateData.todayConfirmed.toString(),
                totalCases: stateData.confirmed.toString(),
                color:Colors.blueGrey,
              ),
              stateTileRow(
                title: "Recovered",
                todayCases: stateData.todayRecovered.toString(),
                totalCases: stateData.recovered.toString(),
                color: Colors.green,
              ),
              stateTileRow(
                title: "Deceased",
                todayCases: stateData.todayDeaths.toString(),
                totalCases: stateData.deaths.toString(),
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: Colors.black,
              offset: Offset(0, 0),
              blurRadius: 18,
              spreadRadius: -10),
        ],
      ),
    );
  }

  Widget stateTileRow({
    String title,
    String todayCases,
    String totalCases,
    Color color,
  }) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontFamily: "Rubik",
                color: Colors.deepPurple.shade700,
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  todayCases,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Rubik",
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_upward,
                  size: 17,
                  color: color,
                ),
                Text(
                  totalCases.padLeft(7),
                  style: TextStyle(
                    fontFamily: "monospace",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
