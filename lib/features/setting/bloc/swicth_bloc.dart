import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'swicth_event.dart';
part 'swicth_state.dart';

class SwicthBloc extends HydratedBloc<SwicthEvent, SwicthState> {
  SwicthBloc() : super(SwicthInitial(switchValue: false)) {
    on<switchOnEvent>((event, emit) {
      emit(const SwicthState(switchValue: true));
    });
    on<switchOffEvent>((event, emit) {
      emit(const SwicthState(switchValue: false));
    });
  }

  @override
  SwicthState? fromJson(Map<String, dynamic> json) {
    return SwicthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwicthState state) {
    return state.toMap() ;
  }
}
