abstract class CounterState {
  final int count;
  const CounterState(this.count);
}

class BuilderState extends CounterState {
  const BuilderState(super.count);
}

class ConsumerState extends CounterState {
  const ConsumerState(super.count);
}
