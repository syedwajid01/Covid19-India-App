import 'package:covid19_india_app/data/models/my_state_data.dart';
import 'package:covid19_india_app/ui/widgets/state_list_tile.dart';
import 'package:flutter/material.dart';

class StateListView extends StatelessWidget {
  final List<MyStateData> stateData;
  const StateListView({Key key, this.stateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        if (stateData[index].state == "Total") return Container();
        return StateListTile(
          stateData: stateData[index],
        );
      },
      itemCount: stateData.length,
    );
  }
}
