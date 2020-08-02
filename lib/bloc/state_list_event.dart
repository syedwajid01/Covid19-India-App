part of 'state_list_bloc.dart';

abstract class StateListEvent extends Equatable {
  const StateListEvent();
}

class GetStateListData extends StateListEvent {
  const GetStateListData();
  @override
  List<Object> get props => [];
}
