import 'package:flutter/widgets.dart';
import 'package:portfolio_prj/empty/empty_screen.dart';
import 'package:portfolio_prj/home/home_screen.dart';
import 'package:portfolio_prj/route/paths.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigator =
      GlobalKey<NavigatorState>();

  static final routes = {
    AppPaths.empty: (context) => const EmptyScreen(),
    AppPaths.home: (context) => const HomeScreen()
  };
}
