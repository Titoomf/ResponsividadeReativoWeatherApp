import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() {
  // WidgetsFlutterBinding();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
