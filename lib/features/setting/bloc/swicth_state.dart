part of 'swicth_bloc.dart';

class SwicthState extends Equatable {
  final bool switchValue;

  const SwicthState({required this.switchValue});
  @override
  List<Object?> get props => [switchValue];
}

class SwicthInitial extends SwicthState {
  const SwicthInitial({required super.switchValue});
}
