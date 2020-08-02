import 'package:covid19_india_app/bloc/state_detail_bloc.dart';
import 'package:covid19_india_app/data/models/my_state_data.dart';
import 'package:covid19_india_app/data/repos/stateDataRepo.dart';
import 'package:covid19_india_app/ui/widgets/state_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateDetailPage extends StatefulWidget {
  final MyStateData stateData;
  StateDetailPage({Key key, this.stateData}) : super(key: key);

  @override
  _StateDetailPageState createState() => _StateDetailPageState();
}

class _StateDetailPageState extends State<StateDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StateDetailBloc(stateDataRepo: CovidStateDataRepo()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(235, 240, 255, 1),
          title: Text(
            widget.stateData.state,
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Color.fromRGBO(235, 240, 255, 1),
        body: StateDetails(
          stateData: widget.stateData,
        ),
      ),
    );
  }
}
