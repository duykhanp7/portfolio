import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:portfolio_prj/home/bloc/bloc_home_event.dart';
import 'package:portfolio_prj/home/bloc/bloc_home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateInitial()) {
    on<HomeEvent>(mapStateToEvent, transformer: restartable());
  }

  void mapStateToEvent(HomeEvent event, Emitter emit) {}
}
