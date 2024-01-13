import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_state.dart';

import 'home_page_event.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePagePageSwipe>(_onHomePagePageSwipe);
  }

  void _onHomePagePageSwipe(
      HomePagePageSwipe event, Emitter<HomePageState> emit) {
    emit(state.copyWith(index: event.pageIndex));
  }
}
