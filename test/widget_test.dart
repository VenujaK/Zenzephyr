import 'package:zenzephyr/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zenzephyr/widgets/home_cards.dart';
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.



void main() {
 testWidgets('CustomAppBar Test', (WidgetTester tester) async {
    // Your test case goes here
  });
  testWidgets('CustomCard Test', (WidgetTester tester) async {
    // Define a mock onPressed function
    bool onPressedCalled = false;

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCard(
            imagePath: 'assets/SympathyBot1.png',
            title: 'Title Text',
            description: 'Description Text',
            onPressed: () {
              onPressedCalled = true;
            },
          ),
        ),
      ),
    );

    // Verify that the Card is rendered
    expect(find.byType(Card), findsOneWidget);

    // Verify that the Image is rendered
    expect(find.byType(Image), findsOneWidget);

    // Verify that the title and description texts are rendered
    expect(find.text('Title Text'), findsOneWidget);
    expect(find.text('Description Text'), findsOneWidget);

    // Verify that the onPressed function is not called initially
    expect(onPressedCalled, false);

    // Simulate a tap on the Card
    await tester.tap(find.byType(Card));
    await tester.pump();

    // Verify that the onPressed function is called when the Card is tapped
    expect(onPressedCalled, true);
  });
}
