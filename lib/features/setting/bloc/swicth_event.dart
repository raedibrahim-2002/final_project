part of 'swicth_bloc.dart';

abstract class SwicthEvent extends Equatable {
  const SwicthEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class switchOnEvent extends SwicthEvent {}

class switchOffEvent extends SwicthEvent {}
