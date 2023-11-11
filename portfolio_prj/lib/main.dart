import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_prj/app.dart';
import 'package:portfolio_prj/bloc/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  runApp(const AppScreen());
}
