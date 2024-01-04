import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_events.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) {
    //  print("Email: ${event.email}");
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }

/*  void _emailEvent(EmailEvent event, Emitter<SignInState> emitter) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emitter) {
          emit(state.copyWith(password: event.password));
  }*/
}
