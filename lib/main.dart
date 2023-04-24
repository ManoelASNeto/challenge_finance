import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'core/navigations/router.dart';
import 'core/navigations/routes.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding();
  await di.init();

  EquatableConfig.stringify = true;
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _router = AppRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      onGenerateRoute: _router.generateRoute,
      initialRoute: Routes.homeScreen,
      navigatorObservers: [HeroController()],
    );
  }
}
