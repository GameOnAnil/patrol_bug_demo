import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'e2e_test.dart';

void main() {
  setUpAll(() {
    locator.registerLazySingleton(() => DataClass());
  });
  group("", () {
    patrolTest("set value", (tester) async {
      locator<DataClass>().name = "James";
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Text("Hello World"),
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 5));
      expect(find.text("Hello World"), findsOneWidget);
    });

    patrolTest("show value", (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Text("Hello World"),
          ),
        ),
      );
      expect(find.text("Hello World"), findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
      expect(locator<DataClass>().name, "James");
    });
  });
}
