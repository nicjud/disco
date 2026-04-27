import 'dart:math';

class Die {
  final int pipCount;
  final List<String>? pipNames; //optional for specific die ie: ["heads", "tails"] for coin flip
  //maybe image asset instead of just pipName? return dots if no image asset

  final int? selectedPip;
  final int? rollsLeft;

  const Die({required this.pipCount, this.pipNames, this.selectedPip, this.rollsLeft});

  String? getRollName() {
    if (selectedPip != null) {
      if (pipNames != null && selectedPip! < pipNames!.length) {
        return pipNames?[selectedPip!];
      }
      return "${selectedPip! + 1}";
    }
    return null; //not rolled yet
  }

  bool canRoll() {
    return rollsLeft != null && rollsLeft! > 0;
  }

  Die roll() {
    if (canRoll()) {
      return Die(pipCount: pipCount, pipNames: pipNames, selectedPip: _randomPip(), rollsLeft: rollsLeft! - 1);
    }
    return this;
  }

  int _randomPip() {
    return Random().nextInt(pipCount);
  }
}
