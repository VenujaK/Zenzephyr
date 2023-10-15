// import 'package:http/testing.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:zenzephyr/Pages/survey.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   testWidgets('SurveyPage Predicted Result Test', (WidgetTester tester) async {
//     final client = MockClient((request) async {
//       return http.Response('{"prediction": 1}', 200);
//     });

//     http.Client = client;

//     await tester.pumpWidget(MaterialApp(
//       home: SurveyPage(),
//     ));

//     await tester.tap(find.text('Submit'));
//     await tester.pump();

//     expect(find.text('You have depression symptoms'), findsOneWidget);
//   });
// }
