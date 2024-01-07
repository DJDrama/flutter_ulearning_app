import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/application/bloc/app_events.dart';
import 'package:ulearning_app/pages/application/bloc/app_states.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppEventTapBottomBar>(_onTapBottomBar);
  }

  void _onTapBottomBar(AppEventTapBottomBar event, Emitter<AppState> emit) {
    emit(state.copyWith(event.index));
  }
}
