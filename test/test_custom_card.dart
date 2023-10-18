import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zenzephyr/widgets/custom_card.dart';

void main() {
  testWidgets('CustomCard Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCard(
            imagePath: 'assets/SympathyBot1.png',
            title: 'Title Text',
            subtitle: 'Subtitle Text',
          ),
        ),
      ),
    );

    // Verify that the card is rendered
    expect(find.byType(Card), findsOneWidget);

    // Verify that the image is rendered
    expect(find.byType(Image), findsOneWidget);

    // Verify that the title and subtitle texts are rendered
    expect(find.text('Title Text'), findsOneWidget);
    expect(find.text('Subtitle Text'), findsOneWidget);
  });
}
