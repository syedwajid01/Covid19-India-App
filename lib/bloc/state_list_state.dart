part of 'state_list_bloc.dart';

abstract class StateListState extends Equatable {
  const StateListState();
}

class StateListInitial extends StateListState {
  @override
  List<Object> get props => [];
}

class StateListLoading extends StateListState {
  const StateListLoading();
  @override
  List<Object> get props => [];
}

class StateListLoaded extends StateListState {
  final List<MyStateData> stateListData;
  const StateListLoaded({this.stateListData});
  @override
  List<Object> get props => [];
}

class StateListError extends StateListState {
  final String error;
  const StateListError({this.error});
  @override
  List<Object> get props => [];
}
