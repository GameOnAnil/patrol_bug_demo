// ignore_for_file: type=lint, invalid_use_of_internal_member

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

// START: GENERATED TEST IMPORTS
import 'e2e_patrol_test.dart' as e2e_patrol_test;
// END: GENERATED TEST IMPORTS

Future<void> main() async {
  final nativeAutomator = NativeAutomator(config: NativeAutomatorConfig());
  await nativeAutomator.initialize();
  PatrolBinding.ensureInitialized(NativeAutomatorConfig())
    ..workaroundDebugDefaultTargetPlatformOverride =
        debugDefaultTargetPlatformOverride;

  // START: GENERATED TEST GROUPS
  group('e2e_patrol_test', e2e_patrol_test.main);
  // END: GENERATED TEST GROUPS
}
