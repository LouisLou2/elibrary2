// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'package:elibapp/common/app_strings.dart';
// import 'package:elibapp/init_affairs.dart';
// import 'package:elibapp/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:elibapp/features/sign_in/bloc/sign_in_event.dart';
// import 'package:elibapp/features/sign_in/bloc/sign_in_state.dart';
//
//
// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     await initBeforeRunApp();
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const App());
//     await tester.pumpAndSettle();
//
//     tester.press(find.bySemanticsLabel('u'));
//     await tester.pumpAndSettle();
//
//     expect(find.byType(Text), findsNWidgets(1));
//
//
//     // Verify that our counter starts at 0.
//     // expect(find.text('0'), findsOneWidget);
//     // expect(find.text('1'), findsNothing);
//
//     // Tap the '+' icon and trigger a frame.
//     // await tester.tap(find.byIcon(Icons.add));
//     // await tester.pump();
//
//     // Verify that our counter has incremented.
//     // expect(find.text('0'), findsNothing);
//     // expect(find.text('1'), findsOneWidget);
//   });
// }
