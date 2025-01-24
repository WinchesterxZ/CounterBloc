import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class BuilderCounterCubit extends Cubit<BuilderCounterState> {
  BuilderCounterCubit() : super(const BuilderCounterState(0));

  void increment() => emit(BuilderCounterState(state.count + 1));
  void decrement() => emit(BuilderCounterState(state.count - 1));
}

class ConsumerCounterCubit extends Cubit<ConsumerCounterState> {
  ConsumerCounterCubit() : super(const ConsumerCounterState(0));

  void increment() => emit(ConsumerCounterState(state.count + 1));
  void decrement() => emit(ConsumerCounterState(state.count - 1));
}
