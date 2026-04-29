import 'package:disco/widgets/die.dart';
import 'package:flutter/material.dart';

class RerollableDie extends StatefulWidget {
  final Die die;
  final Axis? buttonAxis;

  const RerollableDie({super.key, required this.die, this.buttonAxis});

  @override
  State<RerollableDie> createState() => _RerollableDieState();
}

class _RerollableDieState extends State<RerollableDie> {
  Die? _die;

  @override
  void initState() {
    super.initState();
    setState(() => _die = widget.die);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.buttonAxis != null && widget.buttonAxis! == Axis.vertical) {
      return Row(mainAxisSize: MainAxisSize.min, children: [?_die, _rerollButton()]);
    }
    return Column(mainAxisSize: MainAxisSize.min, children: [?_die, _rerollButton()]);
  }

  Widget _rerollButton() {
    return OutlinedButton(
      onPressed: () {
        _die = Die(
          key: UniqueKey(),
          totalPips: _die?.totalPips ?? widget.die.totalPips,
          pipNames: _die?.pipNames,
          onRoll: _die?.onRoll,
        );
        setState(() {});
      },
      child: Text("Reroll Die!"),
    );
  }
}
