import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.asNewInstance();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    locator.registerLazySingleton(() => DataClass());
  });
  group("", () {
    testWidgets("set value", (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      expect(find.text("Hello World"), findsOneWidget);
      locator<DataClass>().name = "James";
    });

    testWidgets("show value", (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      expect(find.text("Hello World"), findsOneWidget);
      expect(locator<DataClass>().name, "James");
    });
  });
}

class DataClass {
  String? name;
}
