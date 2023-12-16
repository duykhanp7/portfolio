import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_prj/app.dart';
import 'package:portfolio_prj/bloc/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  // String baseUrl = const String.fromEnvironment('BASE_URL');
  // String username = const String.fromEnvironment('USERNAME');
  // String password = const String.fromEnvironment('PASSWORD');

  // print('Production enviroment variable $baseUrl $username $password');

  runApp(const AppScreen());
}
