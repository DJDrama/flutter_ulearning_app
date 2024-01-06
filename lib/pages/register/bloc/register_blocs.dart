import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_events.dart';
import 'package:ulearning_app/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterState> {
  RegisterBlocs() : super(const RegisterState()) {
    on<RegisterInputUserName>(_onRegisterInputUserName);
    on<RegisterInputEmail>(_registerInputEmail);
    on<RegisterInputPassword>(_registerInputPassword);
    on<RegisterInputConfirmPassword>(_registerInputConfirmPassword);
  }

  void _onRegisterInputUserName(
      RegisterInputUserName event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _registerInputEmail(
      RegisterInputEmail event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.email));
  }

  void _registerInputPassword(
      RegisterInputPassword event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.password));
  }

  void _registerInputConfirmPassword(
      RegisterInputConfirmPassword event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.confirmPassword));
  }
}
