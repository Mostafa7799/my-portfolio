import 'package:flutter/material.dart';

import 'app.dart';
import 'state/app_settings_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = AppSettingsController();
  await controller.load();
  runApp(PortfolioApp(controller: controller));
}
