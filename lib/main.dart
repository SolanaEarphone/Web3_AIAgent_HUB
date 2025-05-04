import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/app_config.dart';
import 'core/routes/app_router.dart';
import 'core/state/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(title: AppConfig.appName, theme: AppConfig.lightTheme, initialRoute: AppConfig.initialRoute, onGenerateRoute: AppRouter.generateRoute),
    );
  }
}
