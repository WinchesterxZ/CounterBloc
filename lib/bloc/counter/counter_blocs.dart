import 'package:flutter_bloc/flutter_bloc.dart';

// Common events shared between both counter blocs
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

//  Used with BlocBuilder + BlocListener combination
class BuilderCounterBloc extends Bloc<CounterEvent, int> {
  BuilderCounterBloc() : super(0) {
    on<IncrementEvent>((event, emit) => emit(state + 1));
    on<DecrementEvent>((event, emit) => emit(state - 1));
  }
}

//  Used with BlocConsumer for simpler implementation
class ConsumerCounterBloc extends Bloc<CounterEvent, int> {
  ConsumerCounterBloc() : super(0) {
    on<IncrementEvent>((event, emit) => emit(state + 1));
    on<DecrementEvent>((event, emit) => emit(state - 1));
  }
}
