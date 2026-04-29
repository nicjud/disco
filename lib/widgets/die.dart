import 'dart:math';

import 'package:flutter/material.dart';

class Die extends StatefulWidget {
  final int totalPips;
  final List<String>? pipNames;
  final Function(int value)? onRoll;
  final int? overrideValue;

  const Die({super.key, required this.totalPips, this.pipNames, this.onRoll, this.overrideValue});

  Die.coin({super.key, this.onRoll, this.overrideValue}) : totalPips = 2, pipNames = ["Heads", "Tails"];

  const Die.d6({super.key, this.onRoll, this.overrideValue}) : totalPips = 6, pipNames = null;

  const Die.d20({super.key, this.onRoll, this.overrideValue}) : totalPips = 20, pipNames = null;

  @override
  State<Die> createState() => _DieState();
}

class _DieState extends State<Die> {
  late int rollValue;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    rollValue = _rollDie();
    widget.onRoll?.call(rollValue);
    // });
    setState(() {});
  }

  int _rollDie() {
    return widget.overrideValue ?? Random().nextInt(widget.totalPips);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          border: Border.all(),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: SizedBox(
          height: 70,
          width: 70,
          child: Center(
            child: Text(
              _getRollName(),
              style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onPrimary),
            ),
          ),
        ),
      ),
    );
  }

  String _getRollName() {
    if (widget.pipNames != null && rollValue < widget.pipNames!.length) {
      return widget.pipNames![rollValue];
    }
    return "${rollValue + 1}";
  }
}
