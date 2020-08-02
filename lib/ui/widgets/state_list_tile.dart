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
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 25),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Active",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Rubik",
                      color: Colors.deepPurple.shade700,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        stateData.todayActive.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik",
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        size: 17,
                        color: Colors.grey,
                      ),
                      Text(
                        stateData.active.toString().padLeft(7),
                        style: TextStyle(
                          fontFamily: "monospace",
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Confirmed",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Rubik",
                      color: Colors.deepPurple.shade700,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        stateData.todayConfirmed.toString(),
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik",
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        size: 17,
                        color: Colors.blueGrey,
                      ),
                      Text(
                        stateData.confirmed.toString().padLeft(7),
                        style: TextStyle(
                          fontFamily: "monospace",
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Recovered",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Rubik",
                      color: Colors.deepPurple.shade700,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        stateData.todayRecovered.toString(),
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik",
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        size: 17,
                        color: Colors.green,
                      ),
                      Text(
                        stateData.recovered.toString().padLeft(7),
                        style: TextStyle(
                          fontFamily: "monospace",
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Deceased",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Rubik",
                      color: Colors.deepPurple.shade700,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        stateData.todayDeaths.toString(),
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Rubik",
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        size: 17,
                        color: Colors.redAccent,
                      ),
                      Text(
                        stateData.deaths.toString().padLeft(7),
                        style: TextStyle(
                          fontFamily: "monospace",
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
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
              spreadRadius: -10
              ),
        ],
      ),
    );
  }
}
