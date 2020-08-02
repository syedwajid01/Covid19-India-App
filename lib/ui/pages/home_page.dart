import 'package:covid19_india_app/bloc/state_list_bloc.dart';
import 'package:covid19_india_app/data/models/my_state_data.dart';
import 'package:covid19_india_app/data/repos/stateDataRepo.dart';
import 'package:covid19_india_app/ui/widgets/loading.dart';
import 'package:covid19_india_app/ui/widgets/no_data.dart';
import 'package:covid19_india_app/ui/widgets/stateListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StateListBloc>(
      create: (context) => StateListBloc(
        stateDataRepo: CovidStateDataRepo(),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(235, 240, 255, 1),
          title: Text(
            "Covid19 India",
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w400,
              fontSize: 25,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(235, 240, 255, 1),
        body: BlocBuilder<StateListBloc, StateListState>(
          builder: (context, state) {
            if (state is StateListInitial) {
              BlocProvider.of<StateListBloc>(context).add(
                GetStateListData(),
              );
            }
            if (state is StateListLoading) {
              return buildLoading();
            }
            if (state is StateListLoaded) {
              return buildStateList(state.stateListData);
            }
            if (state is StateListError) {
              print(state.error);
              return buildNoData();
            }
            return buildLoading();
          },
        ),
      ),
    );
  }

  Widget buildStateList(List<MyStateData> stateListData) {
    return StateListView(
      stateData: stateListData,
    );
  }

  Widget buildLoading() {
    return Loading();
  }

  Widget buildNoData() {
    return NoData();
  }
}
