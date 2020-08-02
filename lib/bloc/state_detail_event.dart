part of 'state_detail_bloc.dart';

abstract class StateDetailEvent extends Equatable {
  const StateDetailEvent();
}

class GetStateDetailData extends StateDetailEvent {
  final String stateCode;
  const GetStateDetailData({this.stateCode});
  @override
  List<Object> get props => [stateCode];
}
