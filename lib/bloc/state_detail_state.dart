part of 'state_detail_bloc.dart';

abstract class StateDetailState extends Equatable {
  const StateDetailState();
}

class StateDetailInitial extends StateDetailState {
  @override
  List<Object> get props => [];
}

class StateDetailLoading extends StateDetailState {
  const StateDetailLoading();
  @override
  List<Object> get props => [];
}

class StateDetailLoaded extends StateDetailState {
  final Map<String, List<MyStateSingleValue>> patientDataMap;
  const StateDetailLoaded({this.patientDataMap});
  @override
  List<Object> get props => [];
}

class StateDetailError extends StateDetailState {
  final String error;
  const StateDetailError({this.error});
  @override
  List<Object> get props => [error];
}
