import 'package:counter_bloc/cubit/counter_state.dart';
import 'package:counter_bloc/widgets/row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Cubit Counter')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Counter using BlocBuilder + BlocListener
            BlocListener<BuilderCounterCubit, BuilderCounterState>(
              listener: (context, state) {
                if (state.count < 0) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Warning'),
                      content: const Text('First counter is negative'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  BlocBuilder<BuilderCounterCubit, BuilderCounterState>(
                    builder: (context, state) {
                      return Text(
                        'Builder + Listener Counter: ${state.count}',
                        style: Theme.of(context).textTheme.titleLarge,
                      );
                    },
                  ),
                  RowButtons(onIncrementPressed: () {
                    context.read<BuilderCounterCubit>().increment();
                  }, onDecrementPressed: () {
                    context.read<BuilderCounterCubit>().decrement();
                  }),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // Second Counter using BlocConsumer
            Column(
              children: [
                BlocConsumer<ConsumerCounterCubit, ConsumerCounterState>(
                  listener: (context, state) {
                    if (state.count == 10 || state.count == -10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Second counter reached: ${state.count}'),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Text(
                          'Consumer Counter: ${state.count}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        RowButtons(onIncrementPressed: () {
                          context.read<ConsumerCounterCubit>().increment();
                        },
                        onDecrementPressed: () {
                          context.read<ConsumerCounterCubit>().decrement();
                        },)
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
