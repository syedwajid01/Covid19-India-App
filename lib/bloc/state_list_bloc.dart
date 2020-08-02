import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:covid19_india_app/data/models/my_state_data.dart';
import 'package:covid19_india_app/data/repos/stateDataRepo.dart';
import 'package:covid19_india_app/misc/permission_handler.dart';
import 'package:equatable/equatable.dart';

part 'state_list_event.dart';
part 'state_list_state.dart';

class StateListBloc extends Bloc<StateListEvent, StateListState> {
  final StateDataRepo stateDataRepo;
  StateListBloc({this.stateDataRepo}) : super(StateListInitial());

  @override
  Stream<StateListState> mapEventToState(
    StateListEvent event,
  ) async* {
    yield StateListLoading();
    if (event is GetStateListData) {
      try {
        PermissionHandler permissionHandler = PermissionHandler();
        await permissionHandler.askPermission();
        final stateList = await stateDataRepo.fetchStateDataList();
        yield StateListLoaded(stateListData: stateList);
      } catch (error) {
        print(error);
        yield StateListError(error: "Error while loading state List data");
      }
    }
  }
}
