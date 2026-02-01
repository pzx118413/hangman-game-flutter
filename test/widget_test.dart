import 'package:flutter_test/flutter_test.dart';
import 'package:hangman_game/main.dart';

void main() {
  testWidgets('App starts without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const HangmanApp());
    expect(find.byType(HangmanApp), findsOneWidget);
  });
}
