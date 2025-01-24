import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

// Common events shared between both counter blocs
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

//  Used with BlocBuilder + BlocListener combination
class BuilderCounterBloc extends Bloc<CounterEvent, BuilderState> {
  BuilderCounterBloc() : super(const BuilderState(0)) {
    on<IncrementEvent>((event, emit) => emit(BuilderState(state.count + 1)));
    on<DecrementEvent>((event, emit) => emit(BuilderState(state.count - 1)));
  }
}

//  Used with BlocConsumer for simpler implementation
class ConsumerCounterBloc extends Bloc<CounterEvent, ConsumerState> {
  ConsumerCounterBloc() : super(const ConsumerState(0)) {
    on<IncrementEvent>((event, emit) => emit(ConsumerState(state.count + 1)));
    on<DecrementEvent>((event, emit) => emit(ConsumerState(state.count - 1)));
  }
}
