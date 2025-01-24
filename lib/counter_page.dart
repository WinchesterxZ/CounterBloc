import 'package:counter_bloc/bloc/counter/counter_blocs.dart';
import 'package:counter_bloc/bloc/counter/counter_state.dart';
import 'package:counter_bloc/bloc/theme/theme_bloc.dart';
import 'package:counter_bloc/widgets/row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Theme toggle button in app bar
        title: Center(child: const Text('Counter BLoC')),
        actions: [
          IconButton(
            icon: Icon(
              context.watch<ThemeBloc>().state == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🎯 First Counter: Shows even numbers in SnackBar
            // Uses separate BlocListener and BlocBuilder for demonstration
            BlocListener<BuilderCounterBloc, BuilderState>(
              listener: (context, state) {
                if (state.count % 2 == 0 && state.count != 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Even Number: ${state.count}')),
                  );
                }
              },
              child: Column(
                children: [
                  BlocBuilder<BuilderCounterBloc, BuilderState>(
                    builder: (context, state) {
                      return Text(
                        'Builder Counter: ${state.count}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      );
                    },
                  ),
                  RowButtons(
                    onIncrementPressed: () {
                      context.read<BuilderCounterBloc>().add(IncrementEvent());
                    },
                    onDecrementPressed: () {
                      context.read<BuilderCounterBloc>().add(DecrementEvent());
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // 🎯 Second Counter: Shows odd numbers in SnackBar
            // Uses BlocConsumer which combines listener and builder
            BlocConsumer<ConsumerCounterBloc, ConsumerState>(
              listener: (context, state) {
                if (state.count % 2 != 0 && state.count != 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Odd Number: ${state.count}'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      'Consumer Counter: ${state.count}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    RowButtons(onIncrementPressed: () {
                      context.read<ConsumerCounterBloc>().add(IncrementEvent());
                    }, onDecrementPressed: () {
                      context.read<ConsumerCounterBloc>().add(DecrementEvent());
                    }),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}