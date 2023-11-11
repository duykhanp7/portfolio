import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_prj/bloc/app_bloc_providers.dart';
import 'package:portfolio_prj/empty/empty_screen.dart';
import 'package:portfolio_prj/home/home_screen.dart';
import 'package:portfolio_prj/res/app_colors.dart';
import 'package:portfolio_prj/route/paths.dart';
import 'package:portfolio_prj/route/routes.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppScreen();
  }
}

class _AppScreen extends State<AppScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProviders.provider,
        child: MaterialApp(
          title: 'Portfolio',
          theme: ThemeData(
              primaryColor: Colors.amber,
              scaffoldBackgroundColor: AppColors.white),
          home: const HomeScreen(),
          routes: AppRoutes.routes,
          initialRoute: AppPaths.home,
          navigatorKey: AppRoutes.navigator,
          onUnknownRoute: (settings) =>
              MaterialPageRoute(builder: (context) => const EmptyScreen()),
          debugShowCheckedModeBanner: false,
        ));
  }
}
