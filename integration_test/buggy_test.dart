import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:patrol/patrol.dart';

void main() {
  final locator = GetIt.instance;
  setUpAll(() {
    /// Register data class as locator in getIt
    locator.registerLazySingleton(() => DataClass());
  });
  group("", () {
    patrolTest("set value", (tester) async {
      // Set value in data class
      locator<DataClass>().setName("James");
      // Print value
      final name = locator<DataClass>().name;
      debugPrint("First test value:$name");
    });

    patrolTest("show value", (tester) async {
      // Should expect name to be "James"
      expect(locator<DataClass>().name, "James");
    });
  });
}

class DataClass {
  String? name;

  setName(String value) {
    name = value;
  }
}
