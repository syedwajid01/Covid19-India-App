import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'state_detail_event.dart';
part 'state_detail_state.dart';

class StateDetailBloc extends Bloc<StateDetailEvent, StateDetailState> {
  StateDetailBloc() : super(StateDetailInitial());

  @override
  Stream<StateDetailState> mapEventToState(
    StateDetailEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
