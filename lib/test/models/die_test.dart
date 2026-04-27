import 'package:disco/models/die.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("die creation and rolling", () {
    test("test die optional fields", () {
      final die = Die(pipCount: 6);
      //class fields
      expect(die.pipNames, null);
      expect(die.selectedPip, null);
      expect(die.rollsLeft, null);

      //class functions
      expect(die.getRollName(), null);
      expect(die.canRoll(), false);
      expect(die.roll(), die);
    });

    test("test die pip number names", () {
      for (int x = 0; x <= 21; x++) {
        final numberedDie = Die(pipCount: 20, selectedPip: x);
        expect(numberedDie.getRollName(), "${x + 1}");
      }
    });

    test("test die pip names", () {
      final headsCoin = Die(pipCount: 2, pipNames: ["Heads", "Tails"], selectedPip: 0);
      expect(headsCoin.getRollName(), "Heads");
      final tailsCoin = Die(pipCount: 2, pipNames: ["Heads", "Tails"], selectedPip: 1);
      expect(tailsCoin.getRollName(), "Tails");
      final threeSidedCoin = Die(pipCount: 2, pipNames: ["Heads", "Tails"], selectedPip: 2);
      expect(threeSidedCoin.getRollName(), "3");
    });

    test("test die rolling limits", () {
      var rollableDie = Die(pipCount: 6, rollsLeft: 2);
      expect(rollableDie.selectedPip, null);
      expect(rollableDie.canRoll(), true);
      expect(rollableDie.rollsLeft, 2);
      //roll 1
      rollableDie = rollableDie.roll();
      expect(rollableDie.selectedPip, isNotNull);
      expect(rollableDie.canRoll(), true);
      expect(rollableDie.rollsLeft, 1);
      //roll2
      rollableDie = rollableDie.roll();
      expect(rollableDie.selectedPip, isNotNull);
      expect(rollableDie.canRoll(), false);
      expect(rollableDie.rollsLeft, 0);
    });
  });
}
