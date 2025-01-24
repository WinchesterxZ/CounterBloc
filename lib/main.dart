import 'package:counter_bloc/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter/counter_blocs.dart';
import 'bloc/theme/theme_bloc.dart';

void main() {
  runApp(
    // Providing both counters and theme blocs at the root This makes them available throughout the app
    MultiBlocProvider(
      providers: [
        // Two separate counter blocs for independent counting
        BlocProvider(create: (context) => BuilderCounterBloc()),
        BlocProvider(create: (context) => ConsumerCounterBloc()),
        // Theme bloc for light/dark mode toggle
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const CounterPage(),
        );
      },
    );
  }
}


