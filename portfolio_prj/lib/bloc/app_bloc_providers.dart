import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_prj/home/bloc/bloc_home.dart';

class AppBlocProviders {
  static List<BlocProvider> provider = <BlocProvider>[
    BlocProvider<HomeBloc>(create: (context) => HomeBloc())
  ];
}
