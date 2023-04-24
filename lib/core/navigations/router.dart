import 'routes.dart';
import '../../features/finance/presentation/bloc/finance_bloc.dart';
import '../../features/finance/presentation/pages/home_screen.dart';
import '../../features/finance/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';

class AppRoutes {
  final _financeResult = sl<FinanceBloc>();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _financeResult,
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
    }
  }
}
