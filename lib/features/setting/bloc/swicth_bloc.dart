import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'swicth_event.dart';
part 'swicth_state.dart';

class SwicthBloc extends Bloc<SwicthEvent, SwicthState> {
  SwicthBloc() : super(const SwicthInitial(switchValue: false)) {
    on<switchOnEvent>((event, emit) {
      emit(const SwicthState(switchValue: true));
    });
    on<switchOffEvent>((event, emit) {
      emit(const SwicthState(switchValue: false));
    });
  }
}
