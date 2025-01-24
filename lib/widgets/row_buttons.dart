import 'package:flutter/material.dart';

class RowButtons extends StatelessWidget {
  const RowButtons(
      {super.key, required this.onIncrementPressed, this.onDecrementPressed});
  final void Function()? onIncrementPressed;
  final void Function()? onDecrementPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onIncrementPressed,
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: onDecrementPressed,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
