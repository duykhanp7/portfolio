import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:portfolio_prj/app.dart';
import 'package:portfolio_prj/bloc/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  // String baseUrl = const String.fromEnvironment('BASE_URL');
  // String username = const String.fromEnvironment('USERNAME');
  // String password = const String.fromEnvironment('PASSWORD');

  // print('Develop enviroment variable $baseUrl $username $password');

  // const String channel = 'duykhangdeptrai';
  // const MethodChannel platform = MethodChannel(channel);

  // final result = await platform.invokeMethod<String>('getNameDepTrai');
  // print('the result of channel is ' + result.toString());

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const AppScreen());
}
