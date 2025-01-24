abstract class CounterState {
  final int count;
  const CounterState(this.count);
}

class BuilderCounterState extends CounterState {
  const BuilderCounterState(super.count);
}

class ConsumerCounterState extends CounterState {
  const ConsumerCounterState(super.count);
}
