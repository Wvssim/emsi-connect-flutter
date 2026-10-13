import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trying_flutter/main.dart';

void main() {
  testWidgets('Compteur, trois boutons et message dynamique', (tester) async {
    await tester.pumpWidget(const MyApp());
    void expectCounter(int value) {
      final text = tester.widget<Text>(find.byKey(const Key('counter')));
      expect(text.data, '$value');
      expect(text.style?.color, Colors.blue);
      expect(text.style?.fontSize, 40);
      expect(
        find.text(value == 0 ? 'Compteur à zéro' : 'Compteur positif'),
        findsOneWidget,
      );
    }

    expect(find.text('EMSI Flutter'), findsOneWidget);
    expectCounter(0);
    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      expectCounter(0);
    }
    await tester.tap(find.text('Incrémenter'));
    await tester.pump();
    expectCounter(5);
    for (final expected in [3, 1, 0, 0]) {
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      expectCounter(expected);
    }
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.text('Incrémenter'));
      await tester.pump();
    }
    expectCounter(10);
    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
    }
    expectCounter(4);
    await tester.tap(find.text('Réinitialiser'));
    await tester.pump();
    expectCounter(0);
  });
}
