import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:covid19_india_app/data/models/my_state_single_value.dart';
import 'package:covid19_india_app/data/repos/stateDataRepo.dart';
import 'package:equatable/equatable.dart';
part 'state_detail_event.dart';
part 'state_detail_state.dart';

class StateDetailBloc extends Bloc<StateDetailEvent, StateDetailState> {
  final StateDataRepo stateDataRepo;
  StateDetailBloc({this.stateDataRepo}) : super(StateDetailInitial());

  @override
  Stream<StateDetailState> mapEventToState(
    StateDetailEvent event,
  ) async* {
    yield StateDetailLoading();
    if (event is GetStateDetailData) {
      String stateCode = event.stateCode;
      try {
        final statePatientData =
            await stateDataRepo.fetchStatePatientDailyData(stateCode);
        yield StateDetailLoaded(patientDataMap: statePatientData);
      } catch (error) {
        print(error);
        yield StateDetailError(
            error: "While loading state detail data error occured.");
      }
    }
  }
}
